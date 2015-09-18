class DatoLaboral < ActiveRecord::Base
  belongs_to :agente
  belongs_to :sede
end
