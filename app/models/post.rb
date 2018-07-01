class Post < ApplicationRecord
  belongs_to :user

  validates :content, :user, presence: true

  class << self
    # TODO: Write tests.
    def feed(user)
      if user.nil?
        joins(:user).where(users: { is_feed_public: true }).order("posts.created_at DESC")
      else
        # TODO: Can this scoping be better somehow?
        where(id: joins(:user).merge(user.followed_users).pluck(:id)).or(user.posts).order("posts.created_at DESC")
      end
    end
  end
end
