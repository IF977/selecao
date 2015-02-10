class Inscricao < ActiveRecord::Base
  resourcify

  belongs_to :users
  belongs_to :processo_seletivos_linha_pesquisa
end
