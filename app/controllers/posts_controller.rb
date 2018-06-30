class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.feed(current_user)
  end
end
