class ProducaoCientificasController < ApplicationController
  before_action :set_producao_cientifica, only: [:show, :edit, :update, :destroy]
  before_action :load_producao_cientifica, only: :create
  load_and_authorize_resource

  respond_to :html

  def index
    @producao_cientificas = ProducaoCientifica.all
    respond_with(@producao_cientificas)
  end

  def show
    respond_with(@producao_cientifica)
  end

  def new
    @producao_cientifica = ProducaoCientifica.new
    respond_with(@producao_cientifica)
  end

  def edit
  end

  def create
    @producao_cientifica = ProducaoCientifica.new(producao_cientifica_params)
    @producao_cientifica.save
    redirect_to url_for(:controller => "inscricaos", :action => :edit, :id=> @producao_cientifica.inscricao_id)
    
  end

  def update
    @producao_cientifica.update(producao_cientifica_params)
    respond_with(@producao_cientifica)
  end

  def destroy
    @inscricao_id = @producao_cientifica.inscricao_id
    @producao_cientifica.destroy
    redirect_to url_for(:controller => "inscricaos", :action => :edit, :id=> @inscricao_id)
  end

  private
    def set_producao_cientifica
      if (params[:id])
        @producao_cientifica = ProducaoCientifica.find(params[:id])
      end
    end

    def producao_cientifica_params

      params.require(:producao_cientifica).permit(:nome, :indice_publicacao, :primeiro_autor, 
        :tipo_producao, :inscricao_id)
    end

    def load_producao_cientifica
      @producao_cientifica = ProducaoCientifica.new(producao_cientifica_params)
    end    

end
