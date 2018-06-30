class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :index, Post
  end
end