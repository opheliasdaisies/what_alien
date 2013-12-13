require 'bundler'
Bundler.require
require './public/questions'

module Quiz
  class Alien < Sinatra::Application

    get '/' do
      @questions = quiz_questions

      erb :index
    end

    post '/results' do
      @scores = {}
      params.each do |q, alien|
        if @scores[alien] == nil
          @scores[alien] = 1
        else
          @scores[alien] += 1          
        end
      end
      @result = ["",0]
      @scores.each do |alien, num|
        if num > @result[1]
          @result = [alien, num]
        end
      end
      @alien = results[@result[0]]

      erb :results
    end

  end
end
