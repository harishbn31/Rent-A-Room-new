class Room < ActiveRecord::Base
	validates_presence_of :name, :description, :price, :rules,:address, :user_id
	validates_numericality_of :price, :user_id
  validates_length_of :description ,:minimum => 5
	mount_uploader :images, ImagesUploader
  has_many :bookings
	has_many :amenity_rooms
	has_many :amenities ,through: :amenity_rooms
	belongs_to :city
	belongs_to :user
  has_many :reviews
  has_many :special_prices
	before_save :determine
	after_create :change_role
	def determine
  		response = HTTParty.get("http://maps.googleapis.com/maps/api/geocode/json?address=#{self.address}")
  		result = JSON.parse(response.body)
  		
  		self.latitude = result["results"][0]["geometry"]["location"]["lat"]
  		self.longitude = result["results"][0]["geometry"]["location"]["lng"]
  		
  end
  def change_role
  	if self.user.role.name == "guest"
  		self.user.update_attributes(role_id:Role.second.id)	 
  	end
  end
end
