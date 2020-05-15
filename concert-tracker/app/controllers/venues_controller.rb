class VenuesController < ApplicationController
   
  get "/venues/index" do
    
    @venues = Venue.all
    erb :'venues/index'
  end
  
  post '/venues/index' do
    @venues = Venue.all
    erb :'venues/index'
  end

  get "/venues/new" do
    @performers = Performer.all
    erb :'venues/new'
  end

  get "/venues/:id/edit" do
    @venues = Venue.find(params[:id])
    erb :'/venues/edit'
  end
  
  get '/venues/:id/performers' do
    @venues = Venue.find(params[:id])
    erb :'venues/performers'
  end
  
  post '/venues/:id' do
    @venues = Venue.find(params[:id])
    @venues.update(params.select{|k|k=="name" || k=="city"})
    redirect to "venues/#{@venues.id}"
  end

  get "/venues/:id" do
    @venues = Venue.find(params[:id])
    redirect "/venues/index"
  end
  
  post "/venues" do
    unless Venue.valid_params?(params)
      redirect "/venues/new?error=invalid performer"
    end
    @venues = Venue.create(:name => params["name"], :city => params["city"])
#    @performers = Performer.create
    if !params["name"].empty?
      Venue.performers << Performer.create(:name => ["name"], :genre => ["genre"])
    end
    @venues.save
    redirect "/venues/index"
#    redirect "/venues/#{@venues.id}"
  end

  get '/venues/:id/delete' do
    @venues = Venue.delete(params[:id])
    redirect "/venues/index"
  end
end