class Ability
  include CanCan::Ability

  def initialize(user)

    if user.nil?
        can :read, :all
    elsif user.role?"admin"
        can :manage, :all
        can :read, :authorization_rooms
    elsif user.role?"guest"
        can :read, [City,Room,Booking,Review]
        can :create, [Room,Booking,Review]
        can :destroy, Booking do |booking|
            booking.user_id == user.id 
            end
    elsif user.role?"host"
        can [:read,:my_rooms], Room
        can :create ,SpecialPrice
        can [:create],[Room,Booking]
        can [:update,:unconfirmed, :destroy], Booking 
        can [:update,:destroy], Room do |room|
            if room.user_id == user.id
                can :manage, SpecialPrice
                end
            end
        can :read, [City,Room,Amenity,Booking]

   end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
