class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  has_many :authentications

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create { |admin| admin.send_reset_password_instructions unless Rails.env.test? }

  # allows us to create admin user w/o password (will be emailed)
  def password_required?
    new_record? ? false : super
  end

  def devise_mailer
    Devise::Mailer
  end
end
