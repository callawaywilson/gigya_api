module GigyaApi
  class Socialize < Client

    { 
      checkin: {type: :get, path: 'socialize.checkin'},
      delete_account: {type: :get, path: 'socialize.deleteAccount'},
      del_user_settings: {type: :get, path: 'socialize.delUserSettings'},
      facebook_graph_operation: {type: :get, path: 'socialize.facebookGraphOperation'},
      get_albums: {type: :get, path: 'socialize.getAlbums'},
      get_contacts: {type: :get, path: 'socialize.getContacts'},
      get_feed: {type: :get, path: 'socialize.getFeed'},
      get_friends_info: {type: :get, path: 'socialize.getFriendsInfo'},
      get_photos: {type: :get, path: 'socialize.getPhotos'},
      get_places: {type: :get, path: 'socialize.getPlaces'},
      get_raw_data: {type: :get, path: 'socialize.getRawData'},
      get_session_info: {type: :get, path: 'socialize.getSessionInfo'},
      get_user_info: {type: :get, path: 'socialize.getUserInfo'},
      get_user_settings: {type: :get, path: 'socialize.getUserSettings'},
      logout: {type: :get, path: 'socialize.logout'},
      notify_login: {type: :get, path: 'socialize.notifyLogin'},
      notify_registration: {type: :get, path: 'socialize.notifyRegistration'},
      publish_user_action: {type: :get, path: 'socialize.publishUserAction'},
      remove_connection: {type: :get, path: 'socialize.removeConnection'},
      send_notification: {type: :get, path: 'socialize.sendNotification'},
      set_status: {type: :get, path: 'socialize.setStatus'},
      set_uid: {type: :get, path: 'socialize.setUID'},
      set_user_info: {type: :get, path: 'socialize.setUserInfo'},
      set_user_settings: {type: :get, path: 'socialize.setUserSettings'},
      shorten_url: {type: :get, path: 'socialize.shortenURL'}
    }.each { |method, config| define_api_method method, config }

    def get_token params={}
      _params = params.merge client_id: @api_key, client_secret: @secret
      get 'socialize.getToken', _params
    end

  end
end