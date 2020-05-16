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
#    @venues = Venue.create(:name => params["venue_name"], :city => params["city"])
    @venues = Venue.create(params[:venue])
    if !params["performer"]["name"].empty?
      @venues.performers << Performer.create(name: params["performer"]["name"], genre: params["performer"]["genre"])
    end
      
#    performer_selection = params[""]
#    performer_selection.each do |per|
#      @venues.performers << Performer.find(per)
#    end
#    end
    @venues.save
#    redirect "/venues/index"
    redirect "/venues/#{@venues.id}"
  end

  get '/venues/:id/delete' do
    @venues = Venue.delete(params[:id])
    redirect "/venues/index"
  end
end