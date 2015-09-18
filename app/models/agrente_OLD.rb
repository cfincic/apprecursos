class Agrente < ActiveRecord::Base
	belongs_to :tipo_documento
	has_many :familiars
	has_one :dato_laboral
	validates :nombre, presence: true
end
