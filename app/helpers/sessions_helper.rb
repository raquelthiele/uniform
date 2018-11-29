module SessionsHelper
    # Logs in the given usuario.
  def log_in(usuario)
    session[:usuario_id] = usuario.id
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
end
