class User < ApplicationRecord
  has_secure_password validations: false

  has_many :followed_user_maps, foreign_key: "follower_user_id", dependent: :destroy, class_name: "FollowUserMap"
  has_many :follower_user_maps, foreign_key: "followed_user_id", dependent: :destroy, class_name: "FollowUserMap"
  has_many :follower_users, through: :follower_user_maps, class_name: "User", source: :follower_user
  has_many :followed_users, through: :followed_user_maps, class_name: "User", source: :followed_user

  # TODO: Instead of destroying the posts upon user account deletion we could
  # also anonymise them - offering the user an option to do that if they decide
  # to delete their account.
  has_many :posts, dependent: :destroy

  validates :password, presence: true


  def first_name
    name.split(" ").first
  end
end
