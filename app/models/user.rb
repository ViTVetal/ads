class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable,
         :omniauthable, omniauth_providers: [:vkontakte, :facebook]

  def self.find_for_vkontakte_oauth access_token
  	p access_token
    if user = User.where(uid: access_token.uid).first
      user
    else 
      user = User.new(provider: access_token.provider, uid: access_token.uid,
       name: access_token.info.name, email: access_token.info.email, 
       password: Devise.friendly_token[0,20])	
      user.skip_confirmation!
      user.save!
      user
    end
  end

  def self.find_for_facebook_oauth access_token
  	p access_token
    if user = User.where(uid: access_token.uid).first
      user
    else 
      user = User.new(provider: access_token.provider, uid: access_token.uid,
       name: access_token.info.name, email: access_token.info.email, 
       password: Devise.friendly_token[0,20])	
      user.skip_confirmation!
      user.save!
      user
    end
  end    
end
