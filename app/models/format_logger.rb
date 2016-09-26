class FormatLogger

  def formatear(e, registro)
    if registro.nil?
      "[#{Time.zone.now.strftime("%d-%m-%Y %H:%M:%S")}] #{e.class}: #{e.message}\n"
    else
      "[#{Time.zone.now.strftime("%d-%m-%Y %H:%M:%S")}] Error con el registro #{registro.inspect} #{e.class}: #{e.message}\n"
    end
  end

  def formatear_resumen(entidad, total_registros, registros_exitosos, registros_erroneos)
    "Fecha de importacion: 24-11-2004 01:04:44\nEntidad a importar: #{entidad}\nTotal de registros: #{total_registros}\nRegistros exitosos: #{registros_exitosos}\nRegistros erroneos: #{registros_erroneos}\n"
  end
end
