class UsersController < ApplicationController
  
  post '/login' do
    user = User.find_by(username: params["username"], password: params["password"])
    if user
      session[:user_id] = user.id
      redirect to '/account'
    else
      erb :error
    end
  end
  
  get '/signup' do
    if !session[:user_id]
      erb :'users/create_user'
    else
      redirect to '/account'
    end
  end

  post '/signup' do 
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/account'
    end
  end
  
  get '/account' do
    erb :account
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end
end