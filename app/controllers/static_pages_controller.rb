class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @requerimento = Requerimento.new
      @requerimento.requerente_id = current_usuario.id
    end
  end
end
