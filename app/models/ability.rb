class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :index, Post
    can :create, Post if user.persisted?
  end
end