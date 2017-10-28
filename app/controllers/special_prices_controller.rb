class SpecialPricesController < ApplicationController
	load_and_authorize_resource 
	
  before_action :set_special_price, only: [:show, :edit, :update, :destroy]
  	def new
		@special_price = SpecialPrice.new
	end

	def create
		@special_price = SpecialPrice.new(special_price_params)
		@special_price.room_id = params[:room_id]
		if @special_price.save
			redirect_to rooms_path, notice: "added special price"
		end
	end

	def edit

	end
	
	
	private 

  def special_price_params
  	params[:special_price].permit(:start_date, :end_date,
  		:price)
  end
  	def set_special_price
     @special_price = SpecialPrice.find(params[:id])

end
end
