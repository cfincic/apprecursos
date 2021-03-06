class DatoLaboral < ActiveRecord::Base
  belongs_to :agente
  belongs_to :sede

  belongs_to :acto_administrativo
  belongs_to :agrupamiento
  belongs_to :tramo

  has_many :situacion_revistas

  accepts_nested_attributes_for :situacion_revistas, :reject_if => :all_blank, allow_destroy: true

  validate :tiene_situacion_revistas

  validates :situacion_revistas, presence: false
  validates :fecha_ingreso, presence: true
  validates :acto_administrativo, presence: true
  validates :fecha_acto, presence: true
  validates :nivel, presence: true
  validates :grado, presence: true
  validates :ultimo_nivel_estudio, presence: true
  validates :sede, presence: true
  validates :interno, presence: true



  NIVELES = { :Primario => 1, :Secundario => 2 , :Terciario => 3, :Universitario => 4, :Posgrado => 5 }

  attr_accessor :sino_fecha_apto_fisico
  attr_accessor :sino_fecha_curriculum
  attr_accessor :sino_fecha_examen_periodico


  def tiene_situacion_revistas
    errors.add(:base, 'Debe tener como minimo una situacion de revista') if self. situacion_revistas.blank?
  end


end
