class Inscricao < ActiveRecord::Base
  belongs_to :linha_pesquisa
  belongs_to :processo_seletivo
end
