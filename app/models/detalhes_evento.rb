class DetalhesEvento < ActiveRecord::Base
  resourcify
  
  belongs_to :evento
  belongs_to :processo_seletivo

  accepts_nested_attributes_for :evento

end
