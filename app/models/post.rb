class Post < ApplicationRecord
  belongs_to :user

  validates :user, presence: true

  class << self
    def feed(user)
      if user.nil?
        # joins("INNER JOIN users ON posts.user_id = users.id AND users.is_feed_public = true")
        joins(:user).where(users: { is_feed_public: true })
      else
        joins(:user).merge(user.followed_users)
      end
    end
  end
end
