require 'sinatra/base'

module NewRecruit

  class App < Sinatra::Base

    get '/' do
      'Hello world - changed dude'
    end
  end

end