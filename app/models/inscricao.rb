class Inscricao < ActiveRecord::Base
  belongs_to :users
  belongs_to :processo_seletivos_linha_pesquisa
end
