class Post < ApplicationRecord
  MAX_LENGTH = 280

  belongs_to :user

  validates :content, :user, presence: true
  validates :content, length: { maximum: MAX_LENGTH }

  class << self
    # TODO: Write tests.
    def feed(user)
      if user.nil?
        joins(:user).where(users: { is_feed_public: true }).order("posts.created_at DESC")
      else
        where(id: joins(:user).merge(user.followed_users).pluck(:id)).or(user.posts).order("posts.created_at DESC")
      end
    end
  end
end
