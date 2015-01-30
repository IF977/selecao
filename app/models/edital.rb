class Edital < ActiveRecord::Base
	resourcify

	has_many :processo_seletivos
	
	validates_presence_of :numero, :descricao, :data_publicacao

	mount_uploader :arquivo, PictureUploader

end
