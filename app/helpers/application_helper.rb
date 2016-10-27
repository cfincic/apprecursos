module ApplicationHelper
	def obtener_fecha(fecha)
		if !fecha.nil?
			if fecha.class.to_s == 'Date'
				I18n.l(fecha, :format => :short)
			else
				I18n.l(fecha, :format => :myformat)
			end
		end
	end
end
