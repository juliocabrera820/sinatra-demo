require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
  end

  get '/' do
    erb :'auth/sign_in'
  end
end

require_relative '../helpers/session_helper'
