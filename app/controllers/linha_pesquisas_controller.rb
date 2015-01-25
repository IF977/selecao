class LinhaPesquisasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_linha_pesquisa, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @linha_pesquisas = LinhaPesquisa.all
    respond_with(@linha_pesquisas)
  end

  def show
    respond_with(@linha_pesquisa)
  end

  def new
    @linha_pesquisa = LinhaPesquisa.new
    respond_with(@linha_pesquisa)
  end

  def edit
  end

  def create
    @linha_pesquisa = LinhaPesquisa.new(linha_pesquisa_params)
    @linha_pesquisa.save
    respond_with(@linha_pesquisa)
  end

  def update
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
      params.require(:linha_pesquisa).permit(:descricao)
    end
end
