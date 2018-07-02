module UserHelper
  def current_user
    @current_user
  end

  def current_user=(user)
    @current_user = user
  end

  def sign_in(user)
    self.current_user = user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
    allow_any_instance_of(SessionsHelper).to receive(:current_user).and_return(current_user)
  end
end