class PostsChannel < ApplicationCable::Channel
  def subscribed
    # stream_for "PostsChannel"
    stream_from "posts:PostsChannel"
  end

  def unsubscribed
    # TODO: Any cleanup needed when channel is unsubscribed
  end

  # private

  # def current_user
  #   @current_user ||= (User.find(cookies[:user_id]) rescue nil)
  # end
end
