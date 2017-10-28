class Amenity < ActiveRecord::Base
	validates_presence_of :name , :description
	validates_uniqueness_of :name
	has_many :amenity_rooms
	has_many :rooms ,through: :amenity_rooms
end
