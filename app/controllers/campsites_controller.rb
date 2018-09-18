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
      flash[:message] = "A campsite with that name already exists!"
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

  def search
     @list = Campsite.find_by_location(params[:location])
  end
  
  
 private
  def campsite_args
    params.require(:campsite).permit(:name, :address, :description)
  end

end
