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

	def traer_area_id_por_nombre(area)
		@area_array = Area.where("descripcion = ?",area)
		@area_array[0] unless @area_array.nil?		
	end
end
