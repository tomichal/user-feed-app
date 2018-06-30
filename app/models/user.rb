class User < ApplicationRecord
  has_secure_password validations: false

  has_many :followed_user_maps, foreign_key: "follower_user_id", dependent: :destroy
  has_many :follower_user_maps, foreign_key: "followed_user_id", dependent: :destroy, class_name: "FollowedUserMap"

  has_many :follower_users, through: :follower_user_maps, class_name: "User", source: :follower_user
  has_many :followed_users, through: :followed_user_maps, class_name: "User", source: :followed_user

  validates :password, presence: true
end
