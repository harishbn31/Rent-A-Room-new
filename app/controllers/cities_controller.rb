class CitiesController < ApplicationController
    	# before_action :authenticate_user!
      load_and_authorize_resource

  def index
    if params[:search]
       @cities = City.where('name LIKE ?', "%#{params[:search]}%")
    else
  	   @cities = City.all 
    end
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'city was successfully created.' }
        format.json { render :show, status: :created, location: @city }
        format.js
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
        format.js
      end
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
