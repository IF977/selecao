class JavascriptsController < ApplicationController
	def cidades_dinamicas
		@cidades = Cidade.all
	end
end
