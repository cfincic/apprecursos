class Agente < ActiveRecord::Base
  belongs_to :tipo_documento
  belongs_to :localidad
  belongs_to :provincia
  belongs_to :estado_agente
  has_many :familiars
  has_many :hijos
  has_one :dato_laboral

  has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
  validates :provincia, presence: true
  validates :localidad, presence: true
  validates :nombre, presence: true
  validates :tipo_documento, presence: true
  validates :estado_agente, presence: true
  validates :num_legajo, presence: true
  validates :num_legajo, :numericality => { :only_integer => true }
  validates :num_legajo, uniqueness: true
  validates :cuil, presence: true
  validates :cuil, :length => { :is => 11 }
  validates :cuil, :numericality => { :only_integer => true }
  validates :cuil, uniqueness: true

  validates_attachment :foto, :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", 'application/pdf'] },
    :size => { :less_than => 1.megabyte }

  validate :validacion_digitoverificador_de_cuit_cuil!, :if => Proc.new { |a| a.cuil.presence && a.cuil.length == 11 }

  def traer_nombre_apellido
    "#{self.nombre} #{self.apellido}"
  end

  def cuil=(nuevo_cuil)
    nuevo_cuil.blank? ? self[:cuil] = nuevo_cuil : self[:cuil] = nuevo_cuil.delete('-')
  end

  def cuil
  	self[:cuil]
  end

  private

  def validacion_digitoverificador_de_cuit_cuil!
    @validador = ValidadorCuitCuil.new
    unless @validador.validardigitoverificador(cuil)
      errors[:cuil] << "debe estar formado correctamente"
      return false
    end
  end


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
