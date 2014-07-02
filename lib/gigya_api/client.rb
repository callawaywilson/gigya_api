module GigyaApi
  class Client

    @@defaults = {
      host: "https://socialize.gigya.com",
      timeout: 30,
      open_timeout: 30
    }

    def self.defaults
      @@defaults
    end

    def self.defaults=(options)
      @@defaults == options
    end

    def self.define_api_method(method, config)
      define_method(method) do |params = {}|
        self.send config[:type], config[:path], params
      end
    end

    def initialize(params = {})
      @api_key = params[:api_key] || @@defaults[:api_key]
      @secret = params[:secret] || @@defaults[:secret]
      @uid = params[:uid]
      @oauth_token = params[:oauth_token]
      @http_client = params[:http_client] || HttpClient.new
    end

    def provider_profile(provider)
      profile = get_user_info
      profile['identities'].find do |p|
        p['provider'].downcase == provider.downcase
      end
    end

    def get(path, params = {})
      url = "#{@@defaults[:host]}/#{path}"
      response = @http_client.execute :get, url, default_params.merge(params)
      MultiJson.load response
    end


    private

    def default_params
      p = {apiKey: @api_key, secret: @secret, format: 'json'}
      p[:uid] = @uid if @uid
      p[:oauth_token] = @oauth_token if @oauth_token
      return p
    end

    def client(url)
      @http_client_class.new url, 
        :timeout => @@defaults[:timeout], 
        :open_timeout => @@defaults[:open_timeout]
    end

    class HttpClient
      def execute(method, url, params)
        defaults = GigyaApi::Client.defaults
        resource = RestClient::Resource.new url, 
          :timeout => defaults[:timeout], 
          :open_timeout => defaults[:open_timeout]
        resource.send method, params: params
      end
    end

  end

end