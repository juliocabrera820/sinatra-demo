class UsersController < ApplicationController
  include SessionHelper
  get '/users/:id' do
    if logged_in?
      @user = User.find(params[:id])
      erb :'users/show'
    else
      redirect '/auth/sign_in'
    end
  end
end
