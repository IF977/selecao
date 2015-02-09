class LinhaPesquisa < ActiveRecord::Base
	resourcify

	validates_presence_of :descricao

end
