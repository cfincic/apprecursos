module ApplicationHelper
	def obtener_fecha(fecha)
		if !fecha.nil? && fecha.class.to_s == 'Date'
			puts "feeeeeechaaaaaaaa #{fecha}"
			I18n.l(fecha, :format => :short)
		end
	end
end
