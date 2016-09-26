class ImportadorAgente

  def importar
    agente = Agente.new
    proc = lambda { |c, r| AgenteMapper.new.mappear(c, r) }
    csv = ParserCsv.new.parsear(file_csv)
    importador = Importador.new(ruta_log)
    importador.importar(agente, csv, proc)
  end

  private

  def ruta_log
  	Rails.root.join("log/importacion.log")
  end

  def file_csv
  	Rails.root.join("config/agente_prueba.csv")
  end

end
