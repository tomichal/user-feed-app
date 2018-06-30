module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by "current_user"

    def connect
      logger.add_tags 'ActionCable', "current_user"
    end
  end
end
