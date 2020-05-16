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
    @venues = Venue.create(:name => params["name"], :city => params["city"])
    
#    artist_entry = params[:performer]
#    if Performer.find_by(:name => artist_entry)
#      performers = Performer.find_by(:name => artist_entry)
#    else
#      performers = Performer.create(:name => artist_entry)
#    end
    
#    @venues.performers = []
    if !params["name"].empty?
      @venues.performers << Performer.create(:name => ["name"], :genre => ["genre"])
    else
      
      
    performer_selection = params[:venue][:performers]
    performer_selection.each do |per|
      @venues.performers << Performer.find(performer)
    end
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