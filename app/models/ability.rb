class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Category, user_id: user.id if user.present?
  end
end
