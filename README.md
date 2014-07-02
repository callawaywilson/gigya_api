# Gigya-API

A client for the Gigya REST API

## Installation

Add this line to your application's Gemfile:

    gem 'gigya-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gigya-api

## Usage

Set the defaults for your client:

    Gigya::Client.defaults api_key: 'GIGYA-API-KEY', secret: 'GIGYA-SECRET'

Instantiate a client for the API endpoint you want with either a UID or OAuth Token:

    socialize = Gigya::Socialize.new uid: 'MY-GIGYA-UID'
    profile = socialize.get_user_info

Pass any extra methods besides authorization and UID as parameters to the API method:

    socialize.set_status status: "I'm using ruby!"

If you haven't set the `api_key` and `secret`, they can be set when instantiating a client:

    socialize = Gigya::Socialize.new uid: 'MY-GIGYA-UID', 
      api_key: 'GIGYA-API-KEY', 
      secret: 'GIGYA-SECRET'

## TODO

Only the Socialize methods are implemented.  New API endpoints can be easily added by mapping the ruby method to the HTTP method and path.  Check `gigya/socialize` for the example.