class Review < ActiveRecord::Base
	validates_presence_of :review , :food_rating, :cleanliness_rating, :safety_rating, :facility_rating,:locality_rating, :room_id, :user_id
	validates_numericality_of :food_rating
	validates_length_of :review ,:minimum => 5
	belongs_to :room
end
