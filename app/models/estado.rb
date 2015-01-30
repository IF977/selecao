class Estado < ActiveRecord::Base
	has_many :pessoa

	def desc_estado
		self.descricao
	end
end
