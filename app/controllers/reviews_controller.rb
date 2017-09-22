class ReviewsController < ApplicationController
	load_and_authorize_resource

  def index
  	   @reviews = Review.all 
  end

  def create
  	@review = Review.new(review_params)
  	   if @review.save
  	 	   redirect_to room_path, notice: "created review"
  	   end
  end

  def new
  	@review = Review.new
  end

  def update
    @review = Review.find(params[:id])
      if @review.update_attributes(params[:review].permit(:name))
         redirect_to reviews_path ,notice: "Updated the review"
      end
  end

  def show
  end

  def destroy
    @review = review.find(params[:id])
    if @review.destroy
       redirect_to @room_path, notice: "Successfully deleted the review"
    end
  end
    
    private

    def review_params
      params.require(:review).permit(:review, :food_rating, :cleanliness_rating, :safety_rating, :facility_rating,:locality_rating, :room_id, :user_id)
    end


end
