class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.includes(:followed_user_maps).search(params).paginate(page: params[:users_page])
  end

  def update
    @user.save
  end

  private

  def user_params
    params.require(:user).permit(:is_feed_public)
  end
end
