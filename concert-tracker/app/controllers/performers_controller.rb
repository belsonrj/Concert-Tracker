class PerformersController < ApplicationController
  
  get "/performers" do
    redirect_if_not_logged_in 
    @performers = Performers.all
    erb :'performers/show'
  end

  get "/performers/new" do
    redirect_if_not_logged_in 
    @error_message = params[:error]
    erb :'performers/new'
  end

  get "/performers/:id/edit" do
    redirect_if_not_logged_in 
    @error_message = params[:error]
    @Performers = Performers.find(params[:id])
    erb :'performers/edit'
  end

  post "/performers/:id" do
    redirect_if_not_logged_in 
    @performers = Performers.find(params[:id])
    unless Performers.valid_params?(params)
      redirect "performers/#{@performers.id}/edit?error=invalid performer"
    end
    @performers.update(params.select{|k|k=="name" || k=="genre" || k=="venue_id"})
    redirect "/clubs/#{@club.id}"
  end

  get "/performers/:id" do
    redirect_if_not_logged_in 
    @performers = Performers.find(params[:id])
    erb :'performers/show'
  end

  post "/performers" do
    redirect_if_not_logged_in 
    unless Performers.valid_params?(params)
      redirect "/performers/new?error=invalid performer"
    end
    Performers.create(params)
    redirect "/performers"
  end

end