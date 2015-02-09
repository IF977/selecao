class ProcessoSeletivosController < ApplicationController

  before_action :set_processo_seletivo, only: [:show, :edit, :update, :destroy]
  before_action :load_processo_seletivo, only: :create
  load_and_authorize_resource

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
    @processos_seletivos_linha_pesquisa = @processo_seletivo.processo_seletivos_linha_pesquisas.build
    Evento.all.each do |e|
      de = DetalhesEvento.new
      de.evento = e
      de.processo_seletivo = @processo_seletivo
      @processo_seletivo.detalhes_eventos.push(de) 
    end
    respond_with(@processo_seletivo)
  end

  def edit
    @processo_seletivo = ProcessoSeletivo.find(params[:id])
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

  def add_linha_pesquisa
    @processo_seletivo.processo_seletivos_linha_pesquisas
  end

  private
    def set_processo_seletivo
      @processo_seletivo = ProcessoSeletivo.find(params[:id])
    end

    def processo_seletivo_params
      params.require(:processo_seletivo).permit(:numero, :descricao, :data_publicacao, :arquivo, 
        :edital_id, 
        processo_seletivos_linha_pesquisas_attributes: [:processo_seletivo_id, :vagas, :linha_pesquisa_id],
        detalhes_eventos_attributes: [:id, :data_inicial, :data_final, :observacao, 
          :evento_id, :processo_seletivo_id, evento_attributes: [:id, :descricao]])
    end

    def load_processo_seletivo
       @processo_seletivo = ProcessoSeletivo.new(processo_seletivo_params)
    end
end
