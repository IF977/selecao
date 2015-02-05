class DetalhesEvento < ActiveRecord::Base
  belongs_to :evento
  belongs_to :processo_seletivo
end
