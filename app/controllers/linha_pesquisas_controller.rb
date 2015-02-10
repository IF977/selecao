class LinhaPesquisasController < ApplicationController

  before_action :set_linha_pesquisa, only: [:show, :edit, :update, :destroy]
  before_action :load_linha_pesquisa, only: :create
  load_and_authorize_resource

  respond_to :html

  def index
    @linha_pesquisas = LinhaPesquisa.all
    respond_with(@linha_pesquisas)
  end

  def show
    @linha_pesquisa = LinhaPesquisa.find(params[:id])
    respond_with(@linha_pesquisa)
  end

  def new
    @linha_pesquisa = LinhaPesquisa.new
    respond_with(@linha_pesquisa)
  end

  def edit
  end

  def create
    authorize! :create, @linha_pesquisa, :message => 'Não autorizado!'
    @linha_pesquisa = LinhaPesquisa.new(linha_pesquisa_params)
    @linha_pesquisa.save
    respond_with(@linha_pesquisa)
  end

  def update
    authorize! :update, @linha_pesquisa, :message => 'Não autorizado!'
    @linha_pesquisa.update(linha_pesquisa_params)
    respond_with(@linha_pesquisa)
  end

  def destroy
    @linha_pesquisa.destroy
    respond_with(@linha_pesquisa)
  end

  private
    def set_linha_pesquisa
      @linha_pesquisa = LinhaPesquisa.find(params[:id])
    end

    def linha_pesquisa_params
      params.require(:linha_pesquisa).permit(:id, :descricao)
    end

    def load_linha_pesquisa
      @linha_pesquisa = LinhaPesquisa.new(linha_pesquisa_params)
    end

end
