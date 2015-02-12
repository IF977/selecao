class Inscricao < ActiveRecord::Base
  belongs_to :user
  belongs_to :processo_seletivos_linha_pesquisa
  has_many :producao_cientificas

  has_one :pessoa, through: :user

  accepts_nested_attributes_for :producao_cientificas

  def nome_candidato
  	self.user.pessoa.nome + "/" + self.processo_seletivos_linha_pesquisa.processo_seletivo.descricao
  end
end
