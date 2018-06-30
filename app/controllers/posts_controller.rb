class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @post = Post.new
    @posts = Post.feed(current_user)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      broadcast_to_channel(@post)
      # redirect_to posts_url, flash: { success: "Post created." }
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def broadcast_to_channel(post)
    PostsChannel.broadcast_to(
      "PostsChannel",
      post
    )
  end
end
