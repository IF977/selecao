class InscricaosController < ApplicationController
  before_action :set_inscricao, only: [:show, :edit, :update, :destroy]
  before_action :load_inscricao, only: :create
  load_and_authorize_resource

  respond_to :html

  def index
    if (current_user.has_role? :Admin) ||
      (current_user.has_role? :Gestor) ||
      (current_user.has_role? :Avaliador )
      @inscricaos = Inscricao.all
    else
      @inscricaos = Inscricao.where(:user_id => current_user.id)
    end
    respond_with(@inscricaos)
  end

  def show
    @inscricao = Inscricao.find(params[:id])
    @pessoa = Pessoa.where(:user_id => @inscricao.user_id).first
    respond_with(@inscricao)
  end

  def new
    @inscricao = Inscricao.new
    @pessoa = Pessoa.where(:user_id => current_user.id).first 
    respond_with(@inscricao)
  end

  def edit
    @pessoa = Pessoa.where(:user_id => @inscricao.user_id).first
  end

  def create
    @inscricao = Inscricao.new(inscricao_params)
    @inscricao.user_id = current_user.id    
    @inscricao.save
    respond_with(@inscricao)
  end

  def update
    @inscricao.update(inscricao_params)
    respond_with(@inscricao)
  end

  def destroy
    @inscricao.destroy
    respond_with(@inscricao)
  end

  private
    def set_inscricao
      @inscricao = Inscricao.find(params[:id])
    end

    def inscricao_params
      params.require(:inscricao).permit(:media_graduacao, :carga_horaria_graduacao, 
        :tem_pos_graduacao, :graduacao_exterior, :media_mestrado, :tempo_curso_mestrado, 
        :conceito_capes, :tempo_terceiro_grau, :tempo_monitoria, :tempo_iniciacao, 
        :tempo_pdi, :tempo_chefia, :tempo_nivel_superior, :tempo_nivel_medio, 
        :tempo_sem_vinculo, :tempo_estagio, :user_id, :processo_seletivos_linha_pesquisa_id,
         processo_seletivos_linha_pesquisas_attributes: [:id,:processo_seletivo_id, :vagas, :linha_pesquisa_id],
        user_attributes: [:id, :email],
        pessoa_attributes: [:nome]        

        )
    end

    def load_inscricao
      @inscricao = Inscricao.new(inscricao_params)
    end    
end
