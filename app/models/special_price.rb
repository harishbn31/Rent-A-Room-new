class SpecialPrice < ActiveRecord::Base

	validates_presence_of :start_date, :end_date, :room_id,:price
	
	belongs_to :room
	belongs_to :booking
end
