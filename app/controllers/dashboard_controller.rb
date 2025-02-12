class DashboardController < ApplicationController
  before_action :require_authentication
  before_action :set_current_user

  def show
  end

  private

  def set_current_user
    current_session = Session.find_by(id: cookies.signed[:session_id])
    @current_user = current_session.user
  end
end
