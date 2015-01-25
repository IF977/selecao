class EditalsController < ApplicationController
  before_action :set_edital, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @editals = Edital.all
    respond_with(@editals)
  end

  def show
    respond_with(@edital)
  end

  def new
    @edital = Edital.new
    respond_with(@edital)
  end

  def edit
  end

  def create
    @edital = Edital.new(edital_params)
    @edital.save
    respond_with(@edital)
  end

  def update
    @edital.update(edital_params)
    respond_with(@edital)
  end

  def destroy
    @edital.destroy
    respond_with(@edital)
  end

  private
    def set_edital
      @edital = Edital.find(params[:id])
    end

    def edital_params
      params.require(:edital).permit(:numero, :descricao, :data_publicacao, :arquivo)
    end
end
