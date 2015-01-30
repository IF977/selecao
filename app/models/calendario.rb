class Calendario < ActiveRecord::Base
  belongs_to :processo_seletivo

  has_many :evento_calendarios
  has_many :eventos, through: :evento_calendarios

end
