class PostsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "posts:follower_user:#{current_user&.id}"
  end

  def unsubscribed
    # TODO: Any cleanup needed when channel is unsubscribed
  end


  private

  def current_user
    @current_user ||= (User.find_by(id: cookies.signed[:user_id]))
  end
end
