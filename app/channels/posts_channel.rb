class PostsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "posts:follower_user:#{current_user&.id}"
  end

  def unsubscribed
    # TODO: Any cleanup when channel is unsubscribed.
  end
end
