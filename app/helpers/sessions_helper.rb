module SessionsHelper
  def sign_in(user)
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def signed_in_user
    unless signed_in?
      redirect_to login_url, flash: { notice: "Please sign in." }
    end
  end

  def sign_out
    self.current_user = nil
    reset_session
  end

  def current_user=(user)
    cookies.signed[:user_id] = (user ? user.id : nil)
    @current_user = user
  end

  def current_user
    @current_user ||= (User.find(cookies.signed[:user_id]) rescue nil)
  end

  def redirect_back
    redirect_to(session[:return_to] || root_url)
    session.delete(:return_to)
  end

  def store_url_path
    if signed_in?
      session.delete(:return_to) if session[:return_to].present?
    elsif request.fullpath !~ /(login|logout|sessions)/
      fullpath = request.fullpath
      fullpath = fullpath.gsub(/\/$/, ":3000") if Rails.env.development?
      session[:return_to] = "#{request.protocol}#{request.host}#{fullpath}"
    end
  end
end
