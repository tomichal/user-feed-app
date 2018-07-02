class ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery with: :exception
  before_action :store_url_path
  check_authorization
  rescue_from ActionController::InvalidAuthenticityToken, with: :handle_csrf
  rescue_from CanCan::AccessDenied, with: :deny_access


  private

  def deny_access
    flash[:error] = "You don't have access to that page."
    redirect_to root_url
  end

  def handle_csrf
    sign_out
    deny_access
  end
end
