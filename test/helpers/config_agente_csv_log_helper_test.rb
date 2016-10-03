require "test_helper"

class ConfigAgenteCsvLogHelperTest < ActionView::TestCase

  def setup
    @obj = Object.new
    @obj.extend(ConfigAgenteCsvLog)
    config ||= YAML.load_file(Rails.root.join('config/importador_csv_log.yml'))
    @ruta_log ||= config['ruta']['agente']
  end

  def teardown
    File.delete(@ruta_log) if File.exist?(@ruta_log)
  end

  test 'debe responder a obtener_config' do
    @obj.must_respond_to :ruta_log
  end

  test 'debe responder a exist?' do
    @obj.must_respond_to :log_exist?
  end

  test 'debe responder a obtener_log' do
    @obj.must_respond_to :obtener_log
  end

  test 'debe responder a log_html' do
    @obj.must_respond_to :log_html
  end

  test 'debe obtener la config del archivo de log' do
    @obj.ruta_log.must_include 'log'
  end

  test 'debe obtener la config correctamente' do
    @obj.ruta_log.must_equal @ruta_log
  end

  test 'debe levantar y retornar el archivo log del disco' do
    loggear('verdadero')
    @obj.obtener_log.must_equal 'verdadero'
  end

  test 'debe retornar nil si el archivo log no existe' do
    File.delete(@ruta_log) if File.exist?(@ruta_log)
    @obj.obtener_log.must_equal nil
  end

  test 'debe verificar si el archivo log existe (true)' do
    loggear('verdadero')
    @obj.log_exist?.must_equal true
  end

  test 'debe verificar si el archivo log existe (false)' do
    File.delete(@ruta_log) if File.exist?(@ruta_log)
    @obj.log_exist?.must_equal false
  end

  test 'debe reemplazar \n con </br>' do
    msg = "prueba\nmasprueba"
    @obj.log_html(msg).wont_include '\n'
    @obj.log_html(msg).must_include '<br/>'
  end

  private

  def loggear(message)
    File.open(@ruta_log, 'w+') do |f|
      f.write(message)
    end
  end

end
