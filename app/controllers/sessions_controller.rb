class SessionsController < ApplicationController
  before_action :signed_in_user, except: [:new, :create]

  skip_authorization_check

  def new
  end

  def create
    # Prevent session fixation attacks by resetting the session, except for the
    # URL that they should be redirected to after a successful login.
    return_to = session[:return_to]
    reset_session
    session[:return_to] = return_to

    user = User.find_by(username: params[:session][:username].to_s.strip.downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back
    else
      flash.now[:error] = "Invalid username or password."
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to root_url, flash: { success: "You were successfully logged out." }
  end
end
