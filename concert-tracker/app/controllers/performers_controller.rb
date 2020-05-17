class PerformersController < ApplicationController
  
  
  get "/performers/index" do
    
    @performers = Performer.all
    erb :'performers/index'
  end
  
  post '/performers/index' do
    @performers = Performer.all
    erb :'performers/index'
  end

  get "/performers/new" do
    @venues = Venue.all
    @error_message = params[:error]
    erb :'performers/new'
  end

  get "/performers/:id/edit" do
    
    @error_message = params[:error]
    @performers = Performer.find(params[:id])
    erb :'performers/edit'
  end
  
  get '/performers/:id/venues' do
    erb :'performers/venues'
  end

  post "/performers/:id" do
  
    @performers = Performer.find(params[:id])

    @performers.update(params.select{|k|k=="name" || k=="genre" || k=="times_seen"})
    redirect "/performers/#{@performers.id}"
  end

  get "/performers/:id" do
    
    @performers = Performer.find(params[:id])
    redirect "/performers/index"
  end
  
  
  post "/performers" do
   
#    unless Performer.valid_params?(params)
#      redirect "/performers/new?error=invalid performer"
#    end
#    Performer.create(params)

    @performers = Performer.create(params[:performer])
    if !params["venue"]["name"].empty?
      @performers.venues << Venue.create(name: params["venue"]["name"], city: params["venue"]["city"])
    end
      
    @venues.save

    redirect "/performers/#{@performers.id}"
  end
  
  get '/performers/:id/delete' do
    @performers = Performer.delete(params[:id])
    redirect "/performers/index"
  end


end