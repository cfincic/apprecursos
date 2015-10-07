class DatoLaboral < ActiveRecord::Base
	belongs_to :agente
	belongs_to :sede

	belongs_to :acto_administrativo
	belongs_to :agrupamiento
	belongs_to :tramo

	has_many :situacion_revistas
	accepts_nested_attributes_for :situacion_revistas

	validate :tiene_situacion_revistas

	validates :situacion_revistas, presence: false

  	validates :fecha_acto, presence: true
	validates :fecha_apto_fisico, presence: true
	validates :nivel, presence: true
	validates :grado, presence: true


	def tiene_situacion_revistas
	  errors.add(:base, 'Debe tener como minimo una distuaciond e revista') if self. situacion_revistas.blank?
	end

end
