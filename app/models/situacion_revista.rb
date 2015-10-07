class SituacionRevista < ActiveRecord::Base
	belongs_to :dato_laboral
	belongs_to :tipo_contratacion	

	validates :tipo_contratacion, presence: true	
end
