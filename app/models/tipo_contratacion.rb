class TipoContratacion < ActiveRecord::Base
	has_many :situacion_revistas
	validates :descripcion, presence: true	
end
