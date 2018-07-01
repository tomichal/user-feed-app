module ApplicationCable
  class Channel < ActionCable::Channel::Base
    protected

    def current_user
      @current_user ||= (User.find_by(id: cookies.signed[:user_id]))
    end
  end
end
