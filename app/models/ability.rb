class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :index, Post
    can :create, Post if user.persisted?
    can :index, User
    can :create, FollowUserMap
    can :destroy, FollowUserMap, follower_user_id: user.id
  end
end