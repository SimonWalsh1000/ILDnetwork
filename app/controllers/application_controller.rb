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

  def track_visit
    visit = Visit.new
    unless request.bot?
      http_string = request.user_agent
      visit.path = request.path
      user_agent = UserAgent.parse(http_string)
      visit.browser = user_agent.browser
      visit.version = user_agent.version
      visit.platform = user_agent.platform
      visit.ip_address = request.ip
      visit.referrer = request.referer
      # is_mobile_request? ? visit.mobile = "Mobile" : visit.mobile = "Desktop"
      visit.save unless visit.browser == "NewRelicPinger"
    end
  end

end
