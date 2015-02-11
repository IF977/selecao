class PessoasController < ApplicationController
  
  before_action :set_pessoa, only: [:show, :edit, :update, :destroy]
  before_action :load_pessoa, only: :create
  load_and_authorize_resource

  respond_to :html

  def index
    redirect_to('/system/index')
  end

  def show
    redirect_to action: 'edit'
  end

  def new
    @pessoa = Pessoa.new()
  end

  def edit
    @pessoa = Pessoa.find(params[:id])
  end

  def create
    authorize! :create, @pessoa, :message => 'Não autorizado!.'
    @pessoa = Pessoa.new(pessoa_params)
    @pessoa.user = current_user
    #@pessoa.user_id = current_user.id
    if @pessoa.save
      redirect_to pessoas_path, :notice => "Dados pessoais atualizados."
    else
      redirect_to new_pessoa_path, :alert => error_msgs
    end
  end

  def update
    if @pessoa.update(pessoa_params)
      redirect_to pessoas_path, :notice => "Dados pessoais atualizados."
    else
      redirect_to pessoa_path, :alert => error_msgs
    end
  end

  def destroy
    @pessoa.destroy
    respond_with(@pessoa)
  end

  #metodo para exibicao de mensagens de erro
  def error_msgs
    msg = "Não foi possível atualizar os dados pessoais. "
    @pessoa.errors.full_messages.each do |err|
      msg = msg + err + ". "
    end
    msg
  end

  private
    def set_pessoa    
      @pessoa = Pessoa.find(params[:id])
      @pessoa.user ||= current_user
    end

    def pessoa_params
      params.require(:pessoa).permit(:id, :nome, :cpf, :data_nascimento, :naturalidade, :nacionalidade, :estado_civil, :grau_formacao,  
        :logradouro, :numero, :complemento, :bairro, :estado_id, :cidade_id, :cep, :user)
    end

    def load_pessoa
      @pessoa = Pessoa.new(pessoa_params)
    end
end
