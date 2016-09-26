class CustomLogger

  def initialize(ruta_log)
    @ruta_log = ruta_log
  end

  def loggear(message, formato = nil)
    File.open(@ruta_log, 'a+') do |f|
      f.write(message)
    end
  end

end
