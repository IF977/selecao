class LinhaPesquisa < ActiveRecord::Base
	resourcify

	has_many :processo_seletivos_linha_pesquisas
  	has_and_belongs_to_many :processo_seletivos, through: :processo_seletivos_linha_pesquisas

	validates_presence_of :descricao

end
