require 'bundler'
Bundler.require

module Quiz
  class Alien < Sinatra::Application

    get '/' do
      "test"
    end

  end
end