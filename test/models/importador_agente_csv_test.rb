require "test_helper"

class ImportadorAgenteCsvTest < ActiveSupport::TestCase

  def setup
    @file_csv = Rails.root.join("config/agente_prueba_punto_y_coma.csv")
    @ruta_log = Rails.root.join("log/importacion_prueba.log")
  end

  def teardown
    File.delete(@ruta_log) if File.exist?(@ruta_log)
  end

  test 'debe responder a importar' do
    @importador_agente = ImportadorAgenteCsv.new(nil, nil)
    @importador_agente.must_respond_to :importar
  end

  test 'debe importar un agente' do
    Agente.all.map { |a| a.destroy! }
    Agente.all.count.must_equal(0)
    Agente.where(apellido: 'ALAMO').first.must_be_nil
    ImportadorAgenteCsv.new(@file_csv, @ruta_log).importar
    Agente.where(apellido: 'ALAMO').first.wont_be_nil
  end

  test 'debe importar tres agentes' do
    Agente.all.map { |a| a.destroy! }
    Agente.all.count.must_equal(0)
    ImportadorAgenteCsv.new(@file_csv, @ruta_log).importar
    Agente.all.count.must_equal(3)
  end

  test 'debe asignar el archivo csv a importar por parametro' do
    file_csv = 1234
    ruta_log = Rails.root.join("log/importacion_prueba.log")
    @importador_agente = ImportadorAgenteCsv.new(file_csv, ruta_log)
    @importador_agente.file_csv.must_equal(file_csv)
  end

  test 'debe asignar el archivo csv a importar por default' do
    config = YAML.load_file(Rails.root.join('config/importador_csv.yml'))
    file_csv = config['ruta']['agente']
    ruta_log = Rails.root.join("log/importacion_prueba.log")
    @importador_agente = ImportadorAgenteCsv.new(nil, ruta_log)
    @importador_agente.file_csv.must_equal(file_csv)
  end

  test 'debe asignar el log por parametro' do
    file_csv = Rails.root.join("config/agente_prueba.csv")
    ruta_log = 1234
    @importador_agente = ImportadorAgenteCsv.new(file_csv, ruta_log)
    @importador_agente.ruta_log.must_equal(ruta_log)
  end

  test 'debe asignar el log por default' do
    file_csv = Rails.root.join("config/agente_prueba.csv")
    config = YAML.load_file(Rails.root.join('config/importador_csv_log.yml'))
    ruta_log = config['ruta']['agente']
    @importador_agente = ImportadorAgenteCsv.new(file_csv, nil)
    @importador_agente.ruta_log.must_equal(ruta_log)
    File.delete(ruta_log) if File.exist?(ruta_log)
  end

end
