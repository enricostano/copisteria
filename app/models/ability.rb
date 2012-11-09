class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    
    # check if the user is registered or a guest user (not logged in)
    if user.present?

      if user.any_role? :super_admin
        can :manage, :all
      end
    
      if user.any_role? :admin
        can :manage, [User, Institution, Tender, Order]
      end
    
      if user.any_role? :user
        can :show, Tender
        can [:add, :change], :cart
        can [:create, :show], Order, :user_id => user.id
        can :download, UrlConnector
      end

    end
  end
end
