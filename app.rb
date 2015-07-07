require 'sinatra/base'
require 'redis'

module NewRecruit

  class App < Sinatra::Base

    get '/' do
      redis = Redis.new(host: 'redis')
      redis.incr('hits')
      "Hello world - you've viewed this #{redis.get('hits')} times"
    end
  end

end