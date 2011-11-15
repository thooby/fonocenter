class ApplicationController < ActionController::Base
    protect_from_forgery
    def authenticate_user!
      if current_user.nil?
        redirect_to log_in_url, :alert => "Hay que identificarse para conectarse en esta página"
    end
    end
    private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user
end