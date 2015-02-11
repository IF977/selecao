class AvaliacaoCurriculo < ActiveRecord::Base
  belongs_to :user
  belongs_to :inscricao
end
