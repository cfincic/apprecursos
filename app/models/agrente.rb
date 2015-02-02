class Agrente < ActiveRecord::Base
	belongs_to :tipo_documento
	has_many :familiars
	has_many :dato_contactos
	validates :nombre, presence: true
end
