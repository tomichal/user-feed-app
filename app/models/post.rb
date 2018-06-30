class Post < ApplicationRecord
  belongs_to :user

  validates :content, :user, presence: true

  class << self
    # TODO: Write tests.
    def feed(user)
      if user.nil?
        joins(:user).where(users: { is_feed_public: true })
      else
        joins(:user).merge(user.followed_users)
      end
    end
  end
end
