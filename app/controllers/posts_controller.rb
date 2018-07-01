class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @post = Post.new
    @posts = Post.feed(current_user).paginate(page: params[:posts_page])
    if signed_in?
      @users = User.paginate(page: params[:users_page])
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash.now[:success] = "Post created."
      PostRelayJob.perform_later(@post.id)
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
