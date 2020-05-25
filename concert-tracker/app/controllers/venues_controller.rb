class VenuesController < ApplicationController
  
  def delete_performer_venue_association(performer_id, venue_id)
    venue = Venue.find(venue_id)
    performer = venue.performers.find(performer_id)
    venue.performers.delete(performer) if performer
  end
  
  def current_user
    User.find(session[:user_id])
  end
   
  get "/venues/index" do
    @user = current_user
    @venues = Venue.all
    erb :'venues/index'
  end
  
  post '/venues/index' do
    @user = current_user
    @venues = Venue.all
    erb :'venues/index'
  end

  get "/venues/new" do
    @user = current_user
    @performers = Performer.all
    erb :'venues/new'
  end

  get "/venues/:id/edit" do
    @user = current_user
    @venues = Venue.find(params[:id])
    @performers = Performer.all
    erb :'/venues/edit'
  end
  
  get '/venues/:id/performers' do
    @venues = Venue.find(params[:id])
    erb :'venues/performers'
  end
  
  get "/venues/:id/add" do
    @user = current_user
    @venues = Venue.find(params[:id])
    erb :'venues/new_performers'
  end
  
#  post "venues/:id/add"
#    @venues = Venue.find(params[:id])
#    if !params["performer"]["name"].empty?
#      @venues.performers << Performer.create(name: params["performer"]["name"], genre: params["performer"]["genre"])
#    end

#    else
#      @venues.performers << 
#    end
#    @venues.save
#    redirect to "venues/#{@venues.id}"
#  end
  
  patch '/venues/:id' do
    @user = current_user
    @venues = Venue.find(params[:id])
#    @venues.update(params[:venue])
    @new_performer = Performer.create(name: params["performer"]["name"], genre: params["performer"]["genre"])

    if !params["performer"]["name"].empty?
      @venues.performers << @new_performer
      @user.performers << @new_performer
    end
    
    @venues.update(params[:venue])
    @venues.save
    
    redirect to "venues/#{@venues.id}"
  end

  get "/venues/:id" do
    @venues = Venue.find(params[:id])
    redirect "/venues/index"
  end
  
  post "/venues" do
    @user = current_user
    @venues = Venue.create(params[:venue])
    @new_performer = Performer.create(name: params["performer"]["name"], genre: params["performer"]["genre"])
    if !params["performer"]["name"].empty?
      @venues.performers << @new_performer
      @user.performers << @new_performer
    end
    @user.venues << @venues  
#    @venues.save

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