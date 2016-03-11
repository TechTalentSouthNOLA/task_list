class User < ActiveRecord::Base

  # Creates user using the hash that is returned from the Facebook API
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  # Pull profile photo in
  def small_image
    "http://graph.facebook.com/#{uid}/picture?type=small"
  end

  def normal_image
    "http://graph.facebook.com/#{uid}/picture?type=normal"
  end
end
