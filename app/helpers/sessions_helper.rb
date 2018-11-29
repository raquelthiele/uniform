module SessionsHelper
    # Logs in the given usuario.
  def log_in(usuario)
    session[:usuario_id] = usuario.id
  end

  # Returns true if the given usuario is the current usuario.
  def current_usuario?(usuario)
    usuario == current_usuario
  end

    # Returns the current logged-in usuario (if any).
  def current_usuario
    if session[:usuario_id]
      @current_usuario ||= Usuario.find_by(id: session[:usuario_id])
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_usuario.nil?
  end

  # Logs out the current usuario.
  def log_out
    session.delete(:usuario_id)
    @current_usuario = nil
  end

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
