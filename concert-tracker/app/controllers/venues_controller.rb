class VenuesController < ApplicationController
   
  get "/venues/index" do
    
    @venues = Venues.all
    erb :'venues/index'
  end
  
  post '/venues/index' do
    @venues = Venues.all
    erb :'venues/index'
  end

  get "/venues/new" do
    @performers = Performers.all
    @error_message = params[:error]
    erb :'venues/new'
  end

  get "/venues/:id/edit" do
    
    @error_message = params[:error]
    @venues = Venues.find(params[:id])
    erb :'venues/edit'
  end
  
  get '/venues/:id/performers' do
    @venues = Venues.find(params[:id])
    erb :'venues/performers'
  end

  post "/venues/:id" do
  
    @venues = Venues.find(params[:venue])

    @venues.update(params.select{|k|k=="name" || k=="city"})
    redirect "/venues/#{@venues.id}"
  end

  get "/venues/:id" do
    
    @venues = Venues.find(params[:id])
    redirect "/venues/index"
  end
  
  post "/venues" do
   
    unless Venues.valid_params?(params)
      redirect "/venues/new?error=invalid performer"
    end
    @venues = Venues.create(:name => params["name"], :city => params["city"])
    redirect "/venues/#{@venues.id}"
  end

  
  get '/venues/:id/delete' do
    @venues = Venues.delete(params[:id])
    redirect "/venues/index"
  end
end