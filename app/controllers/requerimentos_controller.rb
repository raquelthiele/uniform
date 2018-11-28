class RequerimentosController < ApplicationController
  def show
    @requerimento = Requerimento.find(params[:id])
  end

  def new
    @requerimento = Requerimento.new
  end
end
