class CampsitesController < ApplicationController
  def index
    @campsites = Campsite.all
  end
  
  def new
    @campsite = Campsite.new
  end
  
  def create
    @campsite = Campsite.find_by(name: params[:campsite][:name])
    if @campsite
      # flash[:notice] = "A campsite with that name already exists!"
      redirect_to new_campsite_path
    else
      @campsite = Campsite.create(campsite_args)
      redirect_to campsite_path(@campsite)
    end
  end
  
  def show
    @campsite = Campsite.find_by(id: params[:id])
    @comment = @campsite.comments.build
  end
  
  def edit
    @campsite = Campsite.find_by(id: params[:id])
  end
  
  def update
    @campsite = Campsite.find_by(id: params[:id])
    @campsite.update(address: params[:campsite][:address], description: params[:campsite][:description])
    redirect_to campsite_path(@campsite)
  end
  
 private
  def campsite_args
    params.require(:campsite).permit(:name, :address, :description)
  end
end

          # campsites GET   /campsites(.:format)                                                                     campsites#index
                          # POST  /campsites(.:format)                                                                     campsites#create
             # new_campsite GET   /campsites/new(.:format)                                                                 campsites#new
            # edit_campsite GET   /campsites/:id/edit(.:format)                                                            campsites#edit
                 # campsite GET   /campsites/:id(.:format)                                                                 campsites#show
                          # PATCH /campsites/:id(.:format)                                                                 campsites#update
                          # PUT   /campsites/:id(.:format)                                                                 campsites#update