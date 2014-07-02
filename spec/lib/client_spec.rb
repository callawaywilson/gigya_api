require 'spec_helper'

describe GigyaApi::Client do

  before(:each) do
    @http_client = double("HttpClient")
  end

  it "should get with initialized parameters" do
    client = GigyaApi::Client.new api_key: 'key', secret: 'secret', uid: 'uid', http_client: @http_client
    expect(@http_client).to receive(:execute)
      .with(:get, /test_url/, hash_including(apiKey: 'key', secret: 'secret', uid: 'uid'))
      .and_return("{}")
    client.get "test_url"
  end

end