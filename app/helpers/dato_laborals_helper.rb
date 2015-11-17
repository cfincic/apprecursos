module DatoLaboralsHelper
	def obtener_fecha_de_situacion_de_revista(situacion)
		if situacion.tipo_contratacion.nil?
			puts "***nula*** #{DateTime.new}"
		 	return DateTime.new
		else			
			puts "***fecha *** #{situacion.fecha_alta}"
			return situacion.fecha_alta
		end
	end	

	def traer_area_id_por_nombre(dato_laboral)
		if !dato_laboral.nil? && !dato_laboral.area.blank?
			@area_array = Area.where("descripcion = ?",dato_laboral.area)
			return @area_array[0].id
		end
	end
end
