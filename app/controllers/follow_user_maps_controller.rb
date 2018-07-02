class FollowUserMapsController < ApplicationController
  load_and_authorize_resource

  def create
    @follow_user_map.follower_user = current_user
    @follow_user_map.save
    set_common_variables
  end

  def destroy
    @follow_user_map.destroy
    set_common_variables
  end

  private

  def set_common_variables
    @posts = Post.feed(current_user).paginate(page: params[:posts_page])
    @followed_user = @follow_user_map.followed_user
  end

  def follow_user_map_params
    params.require(:follow_user_map).permit(:followed_user_id)
  end
end
