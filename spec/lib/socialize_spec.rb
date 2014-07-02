require 'spec_helper'

describe GigyaApi::Socialize do

  before(:each) do
    @http_client = double("HttpClient")
  end

  it "should invoke get_user_info" do
    client = GigyaApi::Socialize.new api_key: 'key', secret: 'secret', uid: 'uid', http_client: @http_client
    expect(@http_client).to receive(:execute)
      .with(:get, /socialize.getUserInfo/, hash_including(apiKey: 'key', secret: 'secret', uid: 'uid'))
      .and_return("{}")
    client.get_user_info
  end

end