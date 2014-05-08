# encoding: UTF-8
require 'active_support/concern'
require 'bitfields'
require 'mailchimp'

class User < ActiveRecord::Base
  include User::InstagramUpdater
  include User::MailchimpUpdater
  include User::PromotionGenerator
  include User::PointsUpdater
  include Bitfields

  extend FriendlyId
  friendly_id :username, use: [:slugged, :history, :finders]

  has_many :posts
	has_many :likes
	has_many :authentications
  has_many :discounts
  has_many :promotions, class_name: Spree::Promotion, foreign_key: :swagonomics_user_id

  scope :with_ig_user_id, -> (ig_user_id) { where(ig_user_id: ig_user_id.to_s, disabled: false) }

  # bitfields, :notifications is legacy and can probably be removed
  bitfield :bitfields,
           1 =>  :notifications,
           2 =>  :retroactive_email_sent,
           4 =>  :notifications_digest,
           8 =>  :notifications_comments,
           16 => :notifications_photos

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Virtual attribute for authenticating by either username or email
	# This is in addition to a real persisted field like 'username'
	attr_accessor :login

  # validation
  validates :username, :presence => true, :uniqueness => true
  validates_uniqueness_of :ig_username

  # activerecord::observer methods
  after_create do
    add_points 10
    self.update_attributes(notifications_photos: true, notifications_comments: true, notifications_digest: true)
    send_welcome_email
    mailchimp_list_subscribe if Rails.env.production? # so we don't blow up FactoryGirl.create(:user)
  end

  def send_welcome_email
    UserMailer.delay.registration_confirmation(self)
  end

  def self.get_random
    User.offset(rand(User.count)).first
  end

  # Overwrite Devise’s find_for_database_authentication method for username OR email addy login
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def has_name?
    return self.ig_full_name.present?
  end

  def first_name
    return "" unless self.has_name?
    return self.ig_full_name.split(/\W+/)[0]
  end

  def last_name
    return "" unless self.has_name?
    return self.ig_full_name.split(/\W+/)[1] || ""
  end

  # create an authentication related to the user using current provider (instagram, fb), and UID
  def apply_omniauth(omniauth)
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'], :access_token => omniauth['credentials']['token'])
  end

  # if returns false, password validation won't take place
  def password_required?
    (authentications.empty? || !password.blank?) && super #validate pass when no other authentications
  end


  def like(likeable_type, likeable_id)
    like = self.likes.find_or_create_by(likeable_type: likeable_type, likeable_id: likeable_id)

    if like.update_attributes(ig_user_id: self.ig_user_id)
      like.delay.post_to_instagram
      return like
    end
    return false
  end

  private
    #
    # link post, post's likes & comments to this user (self)
    #
    def link_to_user(post)
      post.update_attributes(user_id: self.id)
      post.comments.with_ig_username(self.ig_username).with_no_user_id.find_each { |comment| comment.update_attributes(user_id: self.id) }
      post.likes.with_ig_username(self.ig_username).with_no_user_id.find_each { |like| like.update_attributes(user_id: self.id) }
    end

    #
    # send email after retroactively adding points
    # currently not being used due to logic in the email
    # needing final number of points and email being sent
    # with delayed job
    #
    def send_retroactive_email
      if !self.retroactive_email_sent?
        self.update_attribute(:retroactive_email_sent, true)
        UserMailer.delay.retroactively_add_points(self)
      end
    end
end
