class ProcessoSeletivosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_processo_seletivo, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @processo_seletivos = ProcessoSeletivo.all
    respond_with(@processo_seletivos)
  end

  def show
    @processo_seletivo = ProcessoSeletivo.find(params[:id])
    @edital = Edital.find(@processo_seletivo.edital_id)
    respond_with(@processo_seletivo)
  end

  def new
    @processo_seletivo = ProcessoSeletivo.new
    @linha_pesquisas
    respond_with(@processo_seletivo)
  end

  def edit
  end

  def create
    @processo_seletivo = ProcessoSeletivo.new(processo_seletivo_params)
    @processo_seletivo.save
    respond_with(@processo_seletivo)
  end

  def update
    @processo_seletivo.update(processo_seletivo_params)
    respond_with(@processo_seletivo)
  end

  def destroy
    @processo_seletivo.destroy
    respond_with(@processo_seletivo)
  end

  private
    def set_processo_seletivo
      @processo_seletivo = ProcessoSeletivo.find(params[:id])
    end

    def processo_seletivo_params
      params.require(:processo_seletivo).permit(:numero, :descricao, :data_publicacao, :arquivo, 
        :edital_id, {:linha_pesquisa_ids => []})
    end
end
