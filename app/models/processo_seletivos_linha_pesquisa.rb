class ProcessoSeletivosLinhaPesquisa < ActiveRecord::Base
  	belongs_to :processo_seletivo
	belongs_to :linha_pesquisa
	#has_many :inscricaos

	validates_presence_of :vagas

	accepts_nested_attributes_for :processo_seletivo #, :linha_pesquisa

	def descricao
  		self.processo_seletivo.descricao + "/" + self.linha_pesquisa.descricao
  	end

end
