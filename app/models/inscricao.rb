class Inscricao < ActiveRecord::Base
  belongs_to :user
  belongs_to :processo_seletivos_linha_pesquisa
  has_many :producao_cientificas

  accepts_nested_attributes_for :producao_cientificas
end
