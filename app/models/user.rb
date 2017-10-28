class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates_presence_of :username
	validates_numericality_of :mobile
	validates_uniqueness_of :username
	belongs_to :role
	has_many :bookings
	has_many :rooms
	has_many :reviews
	after_create :assign_default_role

	def role?(role)
		self.role.name.include?(role)
	end

    def assign_default_role
        self.update_attributes(role_id:Role.last.id)
    end
end

