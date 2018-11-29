class UsuariosController < ApplicationController
  before_action :logged_in_usuario, only: [:index, :edit, :update, :destroy]
  before_action :correct_usuario,   only: [:edit, :update]
  before_action :tecnico_usuario,     only: :destroy

  def index
    @usuarios = Usuario.paginate(page: params[:page])
  end

  def show
    @usuario = Usuario.find(params[:id])
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      log_in @usuario
      flash[:success] = "Obrigada por se cadastrar no Uniform!"
      redirect_to @usuario
    else
      render 'new'
    end
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def update
    @usuario = Usuario.find(params[:id])
    if @usuario.update_attributes(usuario_params)
      flash[:success] = "Perfil atualizado"
      redirect_to @usuario
    else
      render 'edit'
    end
  end

  def destroy
    Usuario.find(params[:id]).destroy
    flash[:success] = "Usuario excluido com sucesso"
    redirect_to usuarios_url
  end

  private
    def usuario_params
      params.require(:usuario).permit(
        :cpf,
        :nome,
        :email,
        :celular,
        :residencial,
        :tipo,
        :matricula,
        :siape,
        :password,
        :password_confirmation
      )
    end
    # Before filters

    # Confirms a logged-in usuario.
    def logged_in_usuario
      unless logged_in?
        store_location
        flash[:danger] = "Por favor, faça login."
        redirect_to login_url
      end
    end

    # Confirms the correct usuario.
    def correct_usuario
      @usuario = Usuario.find(params[:id])
      redirect_to(root_url) unless current_usuario?(@usuario)
    end

    # Confirms an tecnico usuario.
    def tecnico_usuario
      redirect_to(root_url) unless current_usuario.tecnico?
    end
end
