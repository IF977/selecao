class ProcessoSeletivo < ActiveRecord::Base
  resourcify
  belongs_to :edital
  
  has_many :processo_seletivos_linha_pesquisas
  has_many :linha_pesquisas, through: :processo_seletivos_linha_pesquisas

  has_many :detalhes_eventos
  has_many :eventos, through: :detalhes_eventos

  accepts_nested_attributes_for :processo_seletivos_linha_pesquisas

  accepts_nested_attributes_for :detalhes_eventos

  validates_presence_of :descricao, :edital

  def desc_linhas_pesquisa
	  	descricoes = ""
		self.linha_pesquisas.each do |l|
			descricoes = descricoes + l.descricao + ", "
		end
		descricoes[0, descricoes.length - 2]
	end
end
