class AmenitiesController < ApplicationController
	 before_action :authenticate_user!
  load_and_authorize_resource
	def index
		@amenities = Amenity.all
		@amenity = Amenity.new
	end
	def create
		@amenity = Amenity.new(amenity_params)
		if @amenity.save
			redirect_to amenities_path, notice: "created amenity"
		end

	end
	def new
		@amenity = Amenity.new
	end

private
 	def amenity_params
 		params.require(:amenity).permit(:name,:description)
 	end

end
