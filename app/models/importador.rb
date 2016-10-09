class Importador

  def initialize(ruta_log)
    raise ArgumentError, 'No hay ruta del archivo para loguear' if ruta_log.nil?
    @custom_logger = CustomLogger.new(ruta_log)
    @format_logger = FormatLogger.new
  end

  def importar(clase, registros, proc)
    raise ArgumentError, 'No hay registros que recorrer' if registros.blank?
    raise ArgumentError, 'No hay lógica para procesar' if proc.nil?
    reg = nil
    registros_exitosos = 0
    registros_erroneos = 0
    ActiveRecord::Base.transaction do
      registros.map { |r|
        begin
          reg = r
          c = clase.new
          proc.call(c, r)
          c.save!
          registros_exitosos += 1
        rescue => e
          log_registros(e, reg)
          registros_erroneos += 1
        end
      }
      @custom_logger.loggear(@format_logger.formatear_resumen(clase.class.to_s, registros.count, registros_exitosos, registros_erroneos))
      if registros_erroneos > 0
        @custom_logger.loggear("No se ha importado ningún registro")
        raise ActiveRecord::Rollback
      end
    end
  rescue => e
    log_registros(e, reg)
  end

  private

  def log_registros(e, reg)
    msg = @format_logger.formatear(e, reg)
    @custom_logger.loggear(msg)
  end
end
