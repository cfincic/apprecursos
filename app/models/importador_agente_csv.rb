class ImportadorAgenteCsv

  attr_reader :file_csv, :ruta_log

  def initialize(file_csv, ruta_log)
    @file_csv = file_csv.blank? ? obtener_file_csv : file_csv
    @ruta_log = ruta_log.blank? ? obtener_ruta_log : ruta_log
  end

  def importar
    proc = lambda { |c, r| AgenteMapper.new.mappear(c, r) }
    csv = ParserCsv.new.parsear(@file_csv)
    importador = Importador.new(@ruta_log)
    importador.importar(Agente.new, csv, proc)
  end

  private

  def obtener_file_csv
    config = YAML.load_file(Rails.root.join('config/importador_csv.yml'))
    config['ruta']['agente']
  end

  def obtener_ruta_log
    config = YAML.load_file(Rails.root.join('config/importador_csv_log.yml'))
  	config['ruta']['agente']
  end

end
