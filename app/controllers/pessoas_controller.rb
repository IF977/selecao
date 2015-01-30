class PessoasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pessoa, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    redirect_to('/system/index')
  end

  def show
    redirect_to action: 'edit'
  end

  def edit
    authorize! :update, @pessoa, :message => 'Não autorizado!.'
  end

  def create
    @pessoa = Pessoa.new(pessoa_params)
    @pessoa.user_id = current_user.id
    if @pessoa.save
      respond_with(@pessoa)
    else
      redirect_to pessoa_path, :alert => error_msgs
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
      user=User.find(params[:id])
    if user.pessoa == nil
      @pessoa = Pessoa.new
    else
      @pessoa = Pessoa.find(user.pessoa.id)
    end
      @pessoa.user = user 
    end

    def pessoa_params
      params.require(:pessoa).permit(:nome, :cpf, :data_nascimento, :naturalidade, :nacionalidade, :estado_civil, :grau_formacao,  
        :logradouro, :numero, :complemento, :bairro, :estado_id, :cidade_id, :cep)
    end
end
