class AvaliacaoCurriculosController < ApplicationController
  before_action :set_avaliacao_curriculo, only: [:show, :edit, :update, :destroy]
  before_action :load_avaliacao_curriculo, only: :create
  load_and_authorize_resource

  respond_to :html

  def index
    @avaliacao_curriculos = AvaliacaoCurriculo.all
    respond_with(@avaliacao_curriculos)
  end

  def show
    respond_with(@avaliacao_curriculo)
  end

  def new
    @avaliacao_curriculo = AvaliacaoCurriculo.new
    respond_with(@avaliacao_curriculo)
  end

  def edit
  end

  def create
    @avaliacao_curriculo = AvaliacaoCurriculo.new(avaliacao_curriculo_params)
    @avaliacao_curriculo.save
    respond_with(@avaliacao_curriculo)
  end

  def update
    @avaliacao_curriculo.update(avaliacao_curriculo_params)
    respond_with(@avaliacao_curriculo)
  end

  def destroy
    @avaliacao_curriculo.destroy
    respond_with(@avaliacao_curriculo)
  end

  private
    def set_avaliacao_curriculo
      @avaliacao_curriculo = AvaliacaoCurriculo.find(params[:id])
    end

    def avaliacao_curriculo_params
      params.require(:avaliacao_curriculo).permit(:nota_historicos, :nota_producao_cientifica, :nota_experiencia_docente, :nota_experiencia_pdi, :nota_experiencia_profissional, :user_id, :inscricao_id)
    end

    def load_avaliacao_curriculo
      @avaliacao_curriculo = AvaliacaoCurriculo.new(avaliacao_curriculo_params)
    end
end
