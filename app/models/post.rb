class Post < ApplicationRecord
  belongs_to :user

  validates :user, presence: true

  class << self
    def main_feed(user)
      # TODO.
      all
    end
  end
end
