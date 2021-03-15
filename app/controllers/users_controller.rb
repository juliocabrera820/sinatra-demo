class UsersController < ApplicationController
  get '/users/sign_up' do
    erb :'users/sign_up'
  end
end
