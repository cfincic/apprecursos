require "test_helper"

class CustomLoggerTest < ActiveSupport::TestCase

  def setup
    @ruta_log = Rails.root.join("log/importacion.log")
    File.delete(@ruta_log) if File.exist?(@ruta_log)
    @custom_logger = CustomLogger.new(@ruta_log)
  end

  def teardown
    File.delete(@ruta_log) if File.exist?(@ruta_log)
  end

  test 'debe responder a loggear' do
    @custom_logger.must_respond_to :loggear
  end

  test 'debe loguear un mensaje' do
    travel_to Time.new(2004, 11, 24, 01, 04, 44) do
      msg = "prueba 1\nprueba 2\n"
      @custom_logger.loggear(msg)
      File.read(@ruta_log).must_equal(msg)
    end
  end

  test 'debe loguear un mensaje en dos momentos distintos' do
    msg = "prueba 1\nprueba 2\n"
    @custom_logger.loggear(msg)
    msg = "prueba 3\nprueba 4\n"
    @custom_logger.loggear(msg)
    msg = "prueba 1\nprueba 2\nprueba 3\nprueba 4\n"
    File.read(@ruta_log).must_equal(msg)
  end

end
