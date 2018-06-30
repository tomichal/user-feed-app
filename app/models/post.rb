class Post < ApplicationRecord
  belongs_to :user

  validates :user, presence: true

  class << self
    def main_feed(user)
      if user.nil?
        # TODO: All posts from users who chose their feeds to be public.
        all
      else
        # TODO: Posts from users who are followed by the given user.
        all
      end
    end
  end
end
