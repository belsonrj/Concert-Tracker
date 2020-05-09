class UsersController < ApplicationController
  
  get '/users/:id' do
    if !logged_in?
      redirect '/index'
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      erb :'user/account'
    else
      redirect '/index'
    end
  end
  
  get '/login' do 
    @error_message = params[:error]
    if !session[:user_id]
      erb :'user/login'
    else
      redirect '/login'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/account"
    else
      redirect to '/signup'
    end
  end
  
  get '/signup' do
    if !session[:user_id]
      erb :'user/create_user'
    else
      redirect to '/account'
    end
  end

  post '/signup' do 
    if params[:username] == "" || params[:password] == ""
      erb :error
    else
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/signup'
    end
  end

  
  post '/account' do
    erb :'/user/account'
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end
end