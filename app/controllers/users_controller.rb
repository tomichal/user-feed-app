class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.includes(:followed_user_maps).search(params).paginate(page: params[:users_page])
  end

  def update
    @user = User.find(params[:id])
    @user.attributes = user_params
    is_feed_public_changed = @user.is_feed_public_changed?
    if @user.save
      if is_feed_public_changed
        UserRelayJob.perform_now(@user.id)
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:is_feed_public)
  end
end
