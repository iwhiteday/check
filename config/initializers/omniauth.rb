Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'MuMw3KPAG0i6azx5wRKZp0BeZ', 'UzI7W2CMQ46lkddnEc57egWmeCKdH3K63JPE1yomKjIc1tycrt'

  provider :vkontakte, '5934437', 'nXx8BDXbg7Pu7tZ4tMPi'

  provider :facebook, '1492107027490279', 'c39d7161a1ec8847a0f9922be0306505',
      scope: 'public_profile', info_fields: 'id,name,link'

end