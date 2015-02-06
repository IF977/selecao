class Evento < ActiveRecord::Base
	has_many :detalhes_eventos

end
