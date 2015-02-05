class ProcessoSeletivosLinhaPesquisa < ActiveRecord::Base
	belongs_to :linha_pesquisa
  	belongs_to :processo_seletivo

	validates_presence_of :vagas

end
