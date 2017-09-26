class Review < ActiveRecord::Base
	validates_presence_of :review , :food_rating, :cleanliness_rating, :safety_rating, :facility_rating,:locality_rating, :room_id, :user_id
	validates_numericality_of :food_rating
	validates_length_of :review ,:minimum => 5
	belongs_to :room
	belongs_to :user

	validate :check_out


	def check_out
		end_dates = self.user.bookings.where('room_id = ? AND end_date < ?',self.room_id, Date.today)

			if end_dates.empty?
				self.errors.add(:base, "After checkout you can addd review")
			end
	end


end
