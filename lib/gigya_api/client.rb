module GigyaApi
  class Client

    @@defaults = {
      host: "https://socialize.gigya.com",
      timeout: 30,
      open_timeout: 30
    }

    def self.defaults(options)
      @@defaults == options
    end

    def initialize(params = {})
      @api_key = params[:api_key] || @@defaults[:api_key]
      @secret = params[:secret] || @@defaults[:secret]
      @uid = params[:uid]
      @oauth_token = params[:oauth_token]
    end

    def provider_profile(provider)
      profile = get_user_info
      profile['identities'].find do |p|
        p['provider'].downcase == provider.downcase
      end
    end


    private

    def get(path, params = {})
      url = "#{@@defaults[:host]}/#{path}"
      response = client(url).get params: default_params.merge(params)
      JSON.load response
    end

    def default_params
      p = {apiKey: @api_key, secret: @secret, format: 'json'}
      p[:uid] = @uid if @uid
      p[:oauth_token] = @oauth_token if @oauth_token
      return p
    end

    def client(url)
      RestClient::Resource.new url, 
        :timeout => @@defaults[:timeout], 
        :open_timeout => @@defaults[:open_timeout]
    end

    def define_api_method(method, config)
      define_method(method) do |params = {}|
        self.send val[:type], val[:path], params
      end
    end

  end
end