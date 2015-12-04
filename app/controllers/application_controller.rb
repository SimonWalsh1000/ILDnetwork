class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :authenticate_member!
  before_action :current_user


  # before_action :check_user_interests
  #
  # def check_user_interests
  #   if member_signed_in?
  #     if current_user.tag_list.count < 5
  #       @sign_up = true
  #     end
  #   end
  # end


  def current_user
    if member_signed_in?
      @current_user = User.find_by_member_id(current_member.id)
    end
  end


end
