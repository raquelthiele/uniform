class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    # Confirms a logged-in usuario.
    def logged_in_usuario
      unless logged_in?
        store_location
        flash[:danger] = "Por favor, faça login."
        redirect_to login_url
      end
    end
end
