# TODO: Do we care if a user follows himself?
class FollowUserMap < ApplicationRecord
  belongs_to :followed_user, class_name: "User", foreign_key: "followed_user_id"
  belongs_to :follower_user, class_name: "User", foreign_key: "follower_user_id"

  validates :followed_user, :follower_user, presence: true
end
