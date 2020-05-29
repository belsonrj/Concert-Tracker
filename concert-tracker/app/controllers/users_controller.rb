class UsersController < ApplicationController
  
  def logged_in?
    !!session[:user_id]
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect "users/account"
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
      redirect '/users/account'
    end
  end
  
  post '/sessions' do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/users/account'
    end
    erb :index
    #redirect :'/index'
  end
  
  get '/users/account' do

    @user = User.find(session[:user_id])
    erb :'/user/account'
  end

#  get '/account' do
#    erb :'user/account'
#  end  
    
#  post '/account' do
#    erb :'user/account'
#  end

  get '/logout' do
    session.clear
    redirect to '/'
  end
end