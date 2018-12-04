class RequerimentosController < ApplicationController
  before_action :logged_in_usuario, only: [:create, :destroy]

  def index
    @requerimentos = Requerimento.paginate(page: params[:page])
  end

  def create
    @requerimento = Requerimento.new(requerimento_params)
    @requerimento.requerente_id = current_usuario.id
    if @requerimento.save
      flash[:success] = "Requerimento criado!"
      redirect_to current_usuario
    else
      render 'static_pages/home'
    end
  end

  def edit
    @requerimento = Requerimento.find(params[:id])
  end

  def update
    @requerimento = Requerimento.find(params[:id])
    if @requerimento.update_attributes(requerimento_params)
      flash[:success] = "Requerimento atualizado"
      redirect_to current_usuario
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

    def requerimento_params
      params.require(:requerimento).permit(
        :requerente_id,
        :opcao_requerimento_id,
        :descricao,
        :status_requerimento_id,
        :data_criacao,
        :atribuido_id
      )
    end
end
