class PerformersController < ApplicationController
  
  get '/performers/:id/index' do

    @performers = Performer.all
    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      erb :'performers/index'
    else
      redirect '/bags'
    end
  end
  
  
  get "/performers/index" do
    @user = User.find(session[:user_id])
    @performers = Performer.all
    erb :'performers/index'
  end
  
  post '/performers/:id/index' do
    @user = User.find(params[:id])
    @performers = Performer.all
    erb :'performers/index'
  end

  get "/performers/new" do
    @user = 
    @venues = Venue.all
    @error_message = params[:error]
    erb :'performers/new'
  end

  get "/performers/:id/edit" do
    @venues = Venue.all
    @error_message = params[:error]
    @performers = Performer.find(params[:id])
    erb :'performers/edit'
  end
  
  get '/performers/:id/venues' do
    @performers = Performer.find(params[:id])
    erb :'performers/venues'
  end

  post "/performers/:id" do
    @performers = Performer.find(params[:id])
    @performers.update(params[:performer])

    if !params["venue"]["name"].empty?
      @performers.venues << Venue.create(name: params["venue"]["name"], city: params["venue"]["city"])
    end
    
    @performers.save
    redirect "/performers/#{@performers.id}"
  end

  get "/performers/:id" do
    
    @performers = Performer.find(params[:id])
    redirect "/performers/index"
  end
  
  
  post "/performers/:id" do
    @user = User.find(params[:id])
    @performers = Performer.create(params[:performer])
    if !params["venue"]["name"].empty?
      @performers.venues << Venue.create(name: params["venue"]["name"], city: params["venue"]["city"])
    end
    @user.performers << @performers  
    @performers.save
    redirect "/performers/#{@performers.id}"
  end
  
  get '/performers/:id/:venue_id' do
    performer = Performer.find(params[:id])
    venue = performer.venues.find(params[:venue_id])
    performer.venues.delete(venue) if venue
    redirect "/performers/index"
  end
  
  get '/performer/:id/delete' do
    @performers = Performer.delete(params[:id])
    redirect "/performers/index"
  end


end