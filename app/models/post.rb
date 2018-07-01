class Post < ApplicationRecord
  belongs_to :user

  validates :content, :user, presence: true

  class << self
    # TODO: Write tests.
    def feed(user)
      base = joins(:user).order("created_at DESC")
      if user.nil?
        base.where(users: { is_feed_public: true })
      else
        base.merge(user.followed_users)
      end
    end
  end
end
