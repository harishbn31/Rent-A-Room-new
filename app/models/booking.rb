class Booking < ActiveRecord::Base
	validates_presence_of :start_date,:end_date,:user_id,:room_id
	belongs_to :user
	belongs_to :room
	
	validate :check_date


	def check_date

		if self.user.role.name != "host" 
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
			self.errors.add(:start_date, "check start_date")
		end
	end
	end
	end

end
