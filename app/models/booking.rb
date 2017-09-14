class Booking < ActiveRecord::Base
	validates_presence_of :start_date,:end_date,:user_id,:room_id
	belongs_to :user
	belongs_to :room
end
