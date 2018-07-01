class FollowUserMap < ApplicationRecord
  belongs_to :followed_user, class_name: "User", foreign_key: "followed_user_id"
  belongs_to :follower_user, class_name: "User", foreign_key: "follower_user_id"

  validates :followed_user, :follower_user, presence: true
  validate :user_mast_not_follow_self

  private

  def user_mast_not_follow_self
    return true if followed_user_id != follower_user_id
    errors.add(:base, "You must not follow yourself")
  end
end
