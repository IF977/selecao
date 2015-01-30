class EventosCalendario < ActiveRecord::Base
  belongs_to :evento
  belongs_to :calendario
end
