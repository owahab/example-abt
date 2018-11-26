# frozen_string_literal: true

# Main Sinatra Application
class ApplicationController < Sinatra::Base
  enable :sessions
  register Sinatra::Reloader

  get '/' do
    distributor = Distributor.new(
      Option.new(name: :one, weight: 80),
      Option.new(name: :two, weight: 20)
    )
    chosen_option = distributor.pick
    session[:signup_option] = chosen_option.name
    slim chosen_option.name
  end
end
