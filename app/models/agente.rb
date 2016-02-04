class Agente < ActiveRecord::Base
	belongs_to :tipo_documento
	belongs_to :localidad
	belongs_to :provincia
	belongs_to :estado_agente
	has_many :familiars
	has_many :hijos
	has_one :dato_laboral	

	has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
	
	validates :nombre, presence: true
	validates :tipo_documento, presence: true

	validates_attachment :foto, :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", 'application/pdf'] },
    :size => { :less_than => 1.megabyte }
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
