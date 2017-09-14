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
  	 end

  end
  def new
  	@city = City.new
  end
  def show
  end
    
    private

    def city_params
      params.require(:city).permit(:name)
    end
end
