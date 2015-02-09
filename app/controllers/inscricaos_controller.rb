class InscricaosController < ApplicationController

  before_action :set_inscricao, only: [:show, :edit, :update, :destroy]
  before_action :load_inscricao, only: :create
  load_and_authorize_resource

  respond_to :html

  def index
    @inscricaos = Inscricao.all
    respond_with(@inscricaos)
  end

  def show
    @inscricao = Inscricao.find(params[:id])
    respond_with(@inscricao)
  end

  def new
    @inscricao = Inscricao.new
    respond_with(@inscricao)
  end

  def edit
  end

  def create
    @inscricao = Inscricao.new(inscricao_params)
    @inscricao.save
    respond_with(@inscricao)
  end

  def update
    @inscricao.update(inscricao_params)
    respond_with(@inscricao)
  end

  def destroy
    @inscricao.destroy
    respond_with(@inscricao)
  end

  private
    def set_inscricao
      @inscricao = Inscricao.find(params[:id])
    end

    def inscricao_params
      params.require(:inscricao).permit(:media_graduacao, :carga_horaria_graduacao, :tem_pos_graduacao, :graduacao_exterior, :media_mestrado, :tempo_curso_mestrado, :conceito_capes, :users_id, :processo_seletivos_linha_pesquisa_id)
    end

    def load_inscricao
      @inscricao = Inscricao.new(inscricao_params)
    end
end
