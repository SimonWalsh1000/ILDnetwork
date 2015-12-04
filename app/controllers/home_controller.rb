class HomeController < ApplicationController

    def index
      if member_signed_in?
        redirect_to edit_user_path(current_user)
      end
    end

end
