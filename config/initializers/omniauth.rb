Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, twitter_key, twitter_secret

  provider :vkontakte, vk_id , vk_secret

  provider :facebook, facebook_id, facebook_secret
      scope: 'public_profile', info_fields: 'id,name,link'

end
