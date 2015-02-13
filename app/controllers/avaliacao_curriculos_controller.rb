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
    @avaliacao_curriculo = AvaliacaoCurriculo.find(params[:id])
  end

  #A avaliacao eh criada quando um admin atribui um avaliador
  def create
    @avaliacao_curriculo = AvaliacaoCurriculo.new(avaliacao_curriculo_params)
    erros = erros = validar_create(@avaliacao_curriculo)
    if erros == ''
      @avaliacao_curriculo.save
      respond_with(@avaliacao_curriculo)
    else
      redirect_to new_avaliacao_curriculo_path, :alert => erros
    end
  end

  #O update soh serah feito pelos avaliadores. Neste ponto, verificam-se os itens obrigatorios
  def update
    erros = validar_update(@avaliacao_curriculo)
    if erros == ''
      @avaliacao_curriculo.update(avaliacao_curriculo_params)
      respond_with(@avaliacao_curriculo)
    else
      redirect_to edit_avaliacao_curriculo_path, alert: erros
    end
  end

  def validar_create(av)
    erros = ''

    if av.user_id == nil
      erros = erros + "O avaliador deve ser informado.\n"      
    end

    if av.inscricao_id == nil
      erros = erros + "A candidatura deve ser informada.\n"
    end

    if erros == ''
      av = AvaliacaoCurriculo.find_by user_id: avaliacao_curriculo_params[:user_id], 
        inscricao_id: avaliacao_curriculo_params[:inscricao_id]
      if av != nil
        erros = erros + "O avaliador já foi atribuído a esta inscrição.\n"
      end
    end

    return erros
  end

  def validar_update(av)
    erros = ''
    if av.nota_historicos == nil
      erros = erros + "A nota dos históricos deve ser informada.\n"
    end
    if av.nota_producao_cientifica == nil
      erros = erros + "A nota de produção científica deve ser informada.\n"
    end
    if av.nota_experiencia_docente == nil
      erros = erros + "A nota de experiência em docência deve ser informada.\n"
    end
    if av.nota_experiencia_pdi == nil
      erros = erros + "A nota de experiência em PDI deve ser informada.\n"
    end
    if av.nota_experiencia_profissional == nil
      erros = erros + "A nota de experiência profissional não docente deve ser informada.\n"
    end 
    erros
  end

  def destroy
    @avaliacao_curriculo.destroy
    respond_with(@avaliacao_curriculo)
  end

  def buscar
  end

  def avaliar_curriculos
    avaliador = current_user.id
    @avaliacao_curriculos = AvaliacaoCurriculo.search(params[:av])
    respond_with @avaliacao_curriculos
  end

  private
    def set_avaliacao_curriculo
      @avaliacao_curriculo = AvaliacaoCurriculo.find(params[:id])
    end

    def avaliacao_curriculo_params
      params.require(:avaliacao_curriculo).permit(:nota_historicos, :nota_producao_cientifica, 
        :nota_experiencia_docente, :nota_experiencia_pdi, :nota_experiencia_profissional, 
        :user_id, :inscricao_id, 
        user_attributes: [:id, pessoa_attributes: [:id, :nome]])
    end

    def load_avaliacao_curriculo
      @avaliacao_curriculo = AvaliacaoCurriculo.new(avaliacao_curriculo_params)
    end
end
