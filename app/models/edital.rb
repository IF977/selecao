class Edital < ActiveRecord::Base
	resourcify

	has_many :processo_seletivos
	
	validates_presence_of :numero, :descricao, :data_publicacao

	mount_uploader :arquivo, PictureUploader

	def descricao_edial
		self.descricao
	end

end
