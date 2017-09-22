class Booking < ActiveRecord::Base
	validates_presence_of :start_date,:end_date,:user_id,:room_id
	belongs_to :user
	belongs_to :room
	has_many :special_prices
	validate :check_published_date
	validate :check_date, on: :create
	before_save :check_offer_price

	def check_published_date
			if (self.start_date < Date.today) 
			self.errors.add(:base,"date cannot be less than today")
			elsif (self.end_date < self.start_date)
			self.errors.add(:base,"End date can't be less than today or start date")
			end
	end


	def check_date
		past_date = Booking.where('room_id = ?',self.room.id)
		if !past_date.nil?
			new_date = (self.start_date..self.end_date).to_a
			new_array = []
			past_date.each do |date|
				 initial = date.start_date
				 final = date.end_date
				new_array.push((initial..final).to_a)
			end
			if !(new_date & new_array.flatten).empty?
				self.errors.add(:base, "check start_date")
			end
		
		end
	end

	def check_offer_price
		offer_dates = SpecialPrice.where('room_id = ?',self.room.id)
		
			new_date = (self.start_date..self.end_date).to_a
			
				offer_dates.each do |date|
				 initial = date.start_date
				 final = date.end_date
				 offer_days = (initial..final).to_a
				 
				 offer_days.each do |day3|
				 	new_date.each do |day1|
				 	if day1 == day3  
				 		binding.pry
						self.price += date.price + self.room.price
					end
					
				end
			end
		end
	end
end
