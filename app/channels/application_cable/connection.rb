module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      if Rails.env.development?
        self.current_user = :development_connection
      else
        set_current_user || reject_unauthorized_connection
      end
    end

    private

    def set_current_user
      if session = Session.find_by(id: cookies.signed[:session_id])
        self.current_user = session.user
      end
    end
  end
end
