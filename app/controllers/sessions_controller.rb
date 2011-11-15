class SessionsController < ApplicationController
  def new
    end

    def create
      user = User.find_by_nombre(params[:nombre])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to root_url, :notice => "¡Conectado!"
        else
          flash.now.alert = "Invalid email or password"
          render "new"
        end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_url, :notice => "¡Desconectado!"
    end
end
