require 'active_support/concern'

module User::InstagramUpdater
  extend ActiveSupport::Concern

  module ClassMethods
    #
    # build a client to connect to Instagram's API
    #
    def ig_client(user=nil)
      return Instagram.client(access_token: Authentication.get_random.access_token) if user.nil?
      return Instagram.client(access_token: user.authentications.first.access_token)
    end
  end

  #
  # set oauth credentials for Instagram API
  #
  def setup_instagram
    Instagram.configure do |config|
      config.client_id = "f0885384a9e0469586ac89959663d2b1"
      config.client_secret = "39920b9f344f4d4793ff1f1132eaf0f6"
      config.access_token = self.authentications.first.access_token if self.authentications.first
    end
  end

  #
  # sync user's details with instagram API
  #
  def refresh_instagram_details
    self.update_from_instagram(grab_user)
  end

  #
  # update self's attributes from a `user` instagram API user object
  #
  def update_from_instagram(user=nil)
    return false if user.nil?
    self.update_attributes(
      :username           => (user["username"]              rescue nil),
      :ig_username        => (user["username"]              rescue nil),
      :ig_biography       => (user["bio"]                   rescue nil),
      :ig_website         => (user["website"]               rescue nil),
      :ig_profile_picture => (user["profile_picture"]       rescue nil),
      :ig_full_name       => (user["full_name"]             rescue nil),
      :ig_photo_count     => (user["counts"]["media"]       rescue nil),
      :ig_followed_by     => (user["counts"]["followed_by"] rescue nil),
      :ig_follows         => (user["counts"]["follows"]     rescue nil),
      :ig_user_id         => (user["id"]                    rescue nil))
  end

  private
    #
    # grab user object from instagram API
    #
    def grab_user
      client = User.ig_client
      begin
        client.user(self.ig_user_id)
      rescue => e
        Airbrake.notify(e)
        nil
      end
    end
end
