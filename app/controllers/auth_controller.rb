class AuthController < ApplicationController
  include SessionHelper

  get '/auth/sign_up' do
    erb :'auth/sign_up'
  end

  post '/auth/sign_up' do
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.valid?
      @user.save
      redirect 'auth/sign_in'
    else
      redirect 'auth/sign_up'
    end
  end

  get '/auth/sign_in' do
    if logged_in?
      redirect "/users/#{session[:user_id]}"
    else
      erb :'auth/sign_in'
    end
  end

  post '/auth/sign_in' do
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect 'auth/sign_in'
    end
  end

  get '/auth/logout' do
    session.clear
    redirect '/auth/sign_in'
  end
end
