class PeriodoDeContratacion < ActiveRecord::Base
  belongs_to :dato_laboral

  #validate :rango_de_fechas_es_correcto

  validates :fecha_desde, presence: true
  validates :fecha_hasta, presence: true

  def rango_de_fechas_es_correcto
  	puts "************ENTRO!!!***************"
  	if !self.fecha_desde.nil? and !self.fecha_desde.nil?
	  	if self.fecha_hasta > self.fecha_desde
     		self.errors[:base] << 'La "fecha desde" debe ser mayor a la "fecha hasta"'
   		end
	 end
  end
end
