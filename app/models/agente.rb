class Agente < ActiveRecord::Base
	belongs_to :tipo_documento
	belongs_to :localidad
	belongs_to :provincia
	has_many :familiars
	has_one :dato_laboral	
	
	validates :nombre, presence: true
	validates :tipo_documento, presence: true
end
