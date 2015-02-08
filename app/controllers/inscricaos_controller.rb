class InscricaosController < ApplicationController
  before_action :set_inscricao, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @inscricaos = Inscricao.all
    respond_with(@inscricaos)
  end

  def show
    @inscricao = Inscricao.find(params[:id])
    @processo_seletivo_linha_pesquisa = Processo_seletivos_linha_pesquisa.find(@inscricao.processo_seletivos_linha_pesquisa_id,@inscricao.linha_pesquisa_id)
    @processo_seletivo = Processo_seletivo.find(@processo_seletivo_linha_pesquisa.processo_seletivo_id)
    @linha_pesquisa = Linha_pesquisa.find(@inscricao.linha_pesquisa_id)
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
end
