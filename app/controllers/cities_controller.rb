class CitiesController < ApplicationController
    	before_action :authenticate_user!
      load_and_authorize_resource

  def index
    if params[:search]
       @cities = City.where('name LIKE ?', "%#{params[:search]}%")
    else
  	   @cities = City.all 
    end
  end

  def create
  	@city = City.new(city_params)
  	   if @city.save
  	 	   redirect_to cities_path, notice: "created city"
        else
          redirect_to cities_path, notice: "check name"
  	   end
  end

  def new
  	@city = City.new
  end

  def update
    @city = City.find(params[:id])
      if @city.update_attributes(params[:city].permit(:name))
         redirect_to cities_path ,notice: "Updated the city"
      end
  end

  def show
  end

  def destroy
    @city = City.find(params[:id])
    if @city.destroy
       redirect_to cities_path, notice: "Successfully deleted the city"
    end
  end
    
    private

    def city_params
      params.require(:city).permit(:name)
    end
end
