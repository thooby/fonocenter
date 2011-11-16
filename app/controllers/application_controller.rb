class ApplicationController < ActionController::Base
    protect_from_forgery
    def authenticate_user!
      if current_user.nil?
        redirect_to log_in_url, :alert => "Hay que identificarse para conectarse en esta página"
      end
    end
    def authenticate_admin_user!
      if current_user.nombre != 'Fono'
        redirect_to root_url, :alert => "No tiene privilegios para ir a esa página"
      end
    end
    
    private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user
end