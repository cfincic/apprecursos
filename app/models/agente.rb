class Agente < ActiveRecord::Base
	belongs_to :tipo_documento
	belongs_to :localidad
	belongs_to :provincia
	belongs_to :estado_agente
	has_many :familiars
	has_many :hijos
	has_one :dato_laboral	
	
	validates :nombre, presence: true
	validates :tipo_documento, presence: true
end

class TrueClass
  def sino
    "Si"
  end
end

class FalseClass
  def sino
    "No"
  end
end
