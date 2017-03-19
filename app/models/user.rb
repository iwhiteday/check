class User < ApplicationRecord
  def self.from_omniauth(auth_hash)
    provider = auth_hash[:provider]
    case provider
      when 'vkontakte'
        user = find_or_create_by(vkontakte: auth_hash['info']['urls'][provider.capitalize])
      when 'twitter'
        user = find_or_create_by(twitter: auth_hash['info']['urls'][provider.capitalize])
      when 'facebook'
        user = find_or_create_by(facebook: auth_hash['info']['urls'][provider.capitalize])
    end

    user.username = auth_hash['info']['name']
    user.img_url = auth_hash['info']['image']
    user.last_activity = Time.now
    user.save!
    user
  end

  def self.add_social(auth_hash, user)
    provider = auth_hash[:provider]
    url = auth_hash['info']['urls'][provider.capitalize]
    case provider
      when 'vkontakte'
        useless_user = find_by(vkontakte: url)
        useless_user.destroy
        user.vkontakte = url
      when 'twitter'
        useless_user = find_by(twitter: url)
        useless_user.destroy
        user.twitter = url
      when 'facebook'
        useless_user = find_by(facebook: url)
        useless_user.destroy
        user.facebook = url
    end
    user.save
  end
end