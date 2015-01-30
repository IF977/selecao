class Pessoa < ActiveRecord::Base
	resourcify

	validates_presence_of :nome, :cpf, :data_nascimento, :naturalidade, :nacionalidade, :estado_civil, :grau_formacao,  
        :logradouro, :numero, :bairro, :cidade, :estado, :cep
    validates :cpf, uniqueness: true

  	belongs_to :user
  	
end
