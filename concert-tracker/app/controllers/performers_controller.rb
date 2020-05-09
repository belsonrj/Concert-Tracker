class PerformersController < ApplicationController
  
  get "/performers" do
    
    @performers = Performers.all
    erb :'performers/index'
  end

  get "/performers/new" do
    
    @error_message = params[:error]
    erb :'performers/new'
  end

  get "/performers/:id/edit" do
    
    @error_message = params[:error]
    @performers = Performers.find(params[:id])
    erb :'performers/edit'
  end

  post "/performers/:id" do
  
    @performers = Performers.find(params[:id])

    @performers.update(params.select{|k|k=="name" || k=="genre"})
    redirect "/performers/#{@performers.id}"
  end

  get "/performers/:id" do
    
    @performers = Performers.find(params[:id])
    redirect "/performers"
  end

  post "/performers" do
   
    unless Performers.valid_params?(params)
      redirect "/performers/new?error=invalid performer"
    end
    Performers.create(params)
    redirect "/performers"
  end
  


end