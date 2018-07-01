class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.search(params).paginate(page: params[:users_page])
  end
end
