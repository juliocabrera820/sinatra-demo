class AuthController < ApplicationController
  include SessionHelper

  get '/auth/sign_up' do
    erb :'auth/sign_up'
  end

  post '/auth/sign_up' do
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.valid?
      @user.save
      flash[:alert_success] = 'Usuario agregado satisfactoriamente'
      redirect 'auth/sign_in'
    else
      flash[:alert_warning] = 'Error con los datos ingresados'
      redirect 'auth/sign_up'
    end
  end

  get '/auth/sign_in' do
    if logged_in?
      flash[:alert_warning] = 'Ya has iniciado sesión'
      redirect "/users/#{session[:user_id]}"
    else
      flash[:alert_danger] = 'Necesitas iniciar sesión'
      erb :'auth/sign_in'
    end
  end

  post '/auth/sign_in' do
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:alert_info] = "Has iniciado sesión #{@user.name}"
      redirect "/users/#{@user.id}"
    else
      flash[:alert_danger] = 'Error al iniciar sesión'
      redirect 'auth/sign_in'
    end
  end

  get '/auth/logout' do
    session.clear
    flash[:alert_warning] = 'Sesión terminada'
    redirect '/auth/sign_in'
  end
end
