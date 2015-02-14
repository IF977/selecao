class ResultadoFinalsController < ApplicationController
  before_action :set_resultado_final, only: [:show, :edit, :update, :destroy]
  before_action :load_avaliacao_preprojeto, only: :create
  load_and_authorize_resource

  respond_to :html

  def index
    @resultado_finals = ResultadoFinal.all
    respond_with(@resultado_finals)
  end

  def show
    respond_with(@resultado_final)
  end

  def new
    @resultado_final = ResultadoFinal.new
    respond_with(@resultado_final)
  end

  def edit
  end

  def create
    @resultado_final = ResultadoFinal.new(resultado_final_params)
    @resultado_final.save
    respond_with(@resultado_final)
  end

  def update
    @resultado_final.update(resultado_final_params)
    respond_with(@resultado_final)
  end

  def destroy
    @resultado_final.destroy
    respond_with(@resultado_final)
  end

  def finalizar
    @processo_seletivo = ProcessoSeletivo.find(params[:rf])
  end

  private
    def set_resultado_final
      @resultado_final = ResultadoFinal.find(params[:id])
    end

    def resultado_final_params
      params.require(:resultado_final).permit(:inscricao_id, :nota_final)
    end
    def load_resultado_final
      @resultado_final = ResultadoFinal.new(resultado_final_params)
    end
end
