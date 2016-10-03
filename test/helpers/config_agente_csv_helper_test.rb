require "test_helper"

class ConfigAgenteCsvHelperTest < ActionView::TestCase

  def setup
    @obj = Object.new
    @obj.extend(ConfigAgenteCsv)
    @ruta_log ||= Rails.root.join('config/importador_csv.yml')
  end

  test 'debe responder a obtener_config' do
    @obj.must_respond_to :obtener_config_agente_csv
  end

  test 'debe obtener la config del archivo de csv' do
    @obj.obtener_config_agente_csv.must_include 'csv'
  end

  test 'debe obtener la config correctamente' do
    config = YAML.load_file(@ruta_log)
    ruta = config['ruta']['agente']
    @obj.obtener_config_agente_csv.must_equal ruta
  end

  test 'debe existir el arhivo de configuracion' do
    File.exist?(@ruta_log).must_equal true
  end

end
