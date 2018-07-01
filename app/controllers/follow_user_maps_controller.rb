class FollowUserMapsController < ApplicationController
  load_and_authorize_resource

  def create
    @follow_user_map.follower_user = current_user
    @follow_user_map.save
    @followed_user = @follow_user_map.followed_user
  end

  def destroy
    @follow_user_map.destroy
    @followed_user = @follow_user_map.followed_user
  end

  private

  def follow_user_map_params
    params.require(:follow_user_map).permit(:followed_user_id)
  end
end
