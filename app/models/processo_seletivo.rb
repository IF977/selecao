class ProcessoSeletivo < ActiveRecord::Base
  belongs_to :edital
  
  has_many :processo_seletivo_linha_pesquisas
  has_and_belongs_to_many :linha_pesquisas, :join_table => :processo_seletivos_linha_pesquisas

  has_one :calendario

  accepts_nested_attributes_for :processo_seletivo_linha_pesquisas

  validates_presence_of :descricao, :edital

  def desc_linhas_pesquisa
	  	descricoes = ""
		self.linha_pesquisas.each do |l|
			descricoes = descricoes + l.descricao + ", "
		end
		descricoes[0, descricoes.length - 2]
	end
end
