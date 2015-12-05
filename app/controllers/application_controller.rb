class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :authenticate_member!
  before_action :current_user



  def current_user
    if member_signed_in?
      @current_user = User.find_by_member_id(current_member.id)
    end
  end


end
