class Edital < ActiveRecord::Base
	resourcify

	mount_uploader :arquivo, PictureUploader
end
