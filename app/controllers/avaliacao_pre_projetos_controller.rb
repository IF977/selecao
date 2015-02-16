class AvaliacaoPreProjetosController < ApplicationController
  before_action :set_avaliacao_pre_projeto, only: [:show, :edit, :update, :destroy]
  before_action :load_avaliacao_preprojeto, only: :create
  load_and_authorize_resource

  respond_to :html

  def index
    @avaliacao_pre_projetos = AvaliacaoPreProjeto.all
    respond_with(@avaliacao_pre_projetos)
  end

  def show
    respond_with(@avaliacao_pre_projeto)
  end

  def new
    @avaliacao_pre_projeto = AvaliacaoPreProjeto.new
    respond_with(@avaliacao_pre_projeto)
  end

  def edit
    @avaliacao_pre_projeto = AvaliacaoPreProjeto.find(params[:id])
  end

  def create
    @avaliacao_pre_projeto = AvaliacaoPreProjeto.new(avaliacao_pre_projeto_params)
    erros = validar_create(@avaliacao_pre_projeto)
    if erros == ''
      @avaliacao_pre_projeto.save
      respond_with(@avaliacao_pre_projeto)
    else
      redirect_to new_avaliacao_pre_projeto_path, :alert => erros
    end
  end

  def update
    #TODO - Verificar validacao
    # @avaliacao_pre_projetos = load_avaliacao_preprojeto
    # erros = validar_update(@avaliacao_pre_projeto)
    # if erros == ''
      @avaliacao_pre_projeto.update(avaliacao_pre_projeto_params)
      respond_with(@avaliacao_pre_projeto)
    # else
    #   redirect_to edit_avaliacao_pre_projeto_path, :alert => erros
    # end
  end

  def destroy
    @avaliacao_pre_projeto.destroy
    respond_with(@avaliacao_pre_projeto)
  end

  def avaliar_pre_projetos
    avaliador = current_user.id
    @avaliacao_pre_projeto = AvaliacaoPreProjeto.search(params[:av])
    respond_with @avaliacao_pre_projeto
  end

  def validar_create(av)
    erros = ''

    if av.user_id == nil
      erros = erros + "O avaliador deve ser informado.\n"      
    end

    if av.inscricao_id == nil
      erros = erros + "A candidatura deve ser informada.\n"
    end

    return erros
  end

  def validar_update(av)
    erros = ''
    if av.aderencia == nil
      erros = erros + "A nota de aderência deve ser informada.\n"
    end
    if av.alinhamento == nil
      erros = erros + "A nota de alinhamento deve ser informada.\n"
    end
    if av.contextualizacao == nil
      erros = erros + "A nota de contextualização deve ser informada.\n"
    end
    if av.redacao == nil
      erros = erros + "A nota de redação deve ser informada.\n"
    end
    if av.autonomia == nil
      erros = erros + "A nota de autonomia deve ser informada.\n"
    end 
    erros
  end

  private
    def set_avaliacao_pre_projeto
      @avaliacao_pre_projeto = AvaliacaoPreProjeto.find(params[:id])
    end

    def avaliacao_pre_projeto_params
      params.require(:avaliacao_pre_projeto).permit(:user_id, :inscricao_id, :aderencia, :alinhamento, :contextualizacao, :redacao, :autonomia, :consistencia)
    end

    def load_avaliacao_preprojeto
      @avaliacao_pre_projeto = AvaliacaoPreProjeto.new(avaliacao_pre_projeto_params)
    end
end
