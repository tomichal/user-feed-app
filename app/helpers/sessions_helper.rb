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
    session[:user_id] = user ? user.id : nil
    @current_user = user
  end

  def current_user
    return @current_user if defined?(@current_user)
    if session[:user_id].present?
      @current_user = User.friendly.find(session[:user_id]).try(:becomes, User) rescue nil
    end
  end

  def redirect_back
    redirect_to(session[:return_to] || root_url)
    session.delete(:return_to)
  end

  def store_url_path
    if signed_in?
      session.delete(:return_to) if session[:return_to].present?
    elsif request.fullpath !~ /(login|logout|sessions)/
      session[:return_to] = "#{request.protocol}#{request.host}#{request.fullpath}"
    end
  end
end
