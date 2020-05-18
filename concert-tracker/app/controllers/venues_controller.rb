class VenuesController < ApplicationController
  
  def delete_performer_venue_association(performer_id, venue_id)
    venue = Venue.find(venue_id)
    performer = venue.performers.find(performer_id)
    venue.performers.delete(performer) if performer
  end
   
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
    @performers = Performer.all
    erb :'/venues/edit'
  end
  
  get '/venues/:id/performers' do
    @venues = Venue.find(params[:id])
    erb :'venues/performers'
  end
  
  post '/venues/:id' do
    @venues = Venue.find(params[:id])
    @venues.update(params[:venue])
#    @venues.update(params.select{|k|k=="name" || k=="city"})
    if !params["performer"]["name"].empty?
      @venues.performers << Performer.create(name: params["performer"]["name"], genre: params["performer"]["genre"])
    end
    
    @venues.save
    
    redirect to "venues/#{@venues.id}"
  end

  get "/venues/:id" do
    @venues = Venue.find(params[:id])
    redirect "/venues/index"
  end
  
  post "/venues" do
    @venues = Venue.create(params[:venue])
    if !params["performer"]["name"].empty?
      @venues.performers << Performer.create(name: params["performer"]["name"], genre: params["performer"]["genre"])
    end
      
    @venues.save

    redirect "/venues/index"
  end
  
  get '/venues/:id/:performer_id' do
    venue = Venue.find(params[:id])
    performer = venue.performers.find(params[:performer_id])
    venue.performers.delete(performer) if performer
    redirect "/venues/index"
  end

  get '/venue/:id/delete' do
    @venues = Venue.delete(params[:id])
    redirect "/venues/index"
  end
end