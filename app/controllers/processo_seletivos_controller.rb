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

  def processo_seletivos_abertos
    @processo_seletivos_abertos = []
    ProcessoSeletivo.where('id not in (select ps.id 
      from resultado_finals rf join inscricaos i on rf.inscricao_id = i.id 
      join processo_seletivos_linha_pesquisas pslp on i.processo_seletivos_linha_pesquisa_id = pslp.id 
      join processo_seletivos ps on pslp.processo_seletivo_id = ps.id)').find_each do |processo|
      @processo_seletivos_abertos.push(processo)
    end
    respond_with @processo_seletivos_abertos
  end

  def finalizar_processo_seletivo
    @processo_seletivo = ProcessoSeletivo.find(params[:ps])
    @edital = Edital.find(@processo_seletivo.edital_id)
    respond_with(@processo_seletivo)
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
