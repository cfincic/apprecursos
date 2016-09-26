require "test_helper"

class FormatLoggerTest < ActiveSupport::TestCase

  def setup
    @format_logger = FormatLogger.new
  end

  test 'debe responder a formatear' do
    @format_logger.must_respond_to :formatear
  end

  test 'debe responder a formatear resumen' do
    @format_logger.must_respond_to :formatear_resumen
  end

  test 'debe logguear con dos parametros' do
    foo = OpenStruct.new({ :id => 1, :name => "foo", :phone => "555-1212" })
    e = NotImplementedError.new 'Debe implementarse el método mappear'
    travel_to Time.new(2004, 11, 24, 01, 04, 44) do
      msg = "[24-11-2004 01:04:44] Error con el registro #{foo.inspect} #{e.class}: #{e.message}\n#{e.backtrace}"
      @format_logger.formatear(e, foo).must_equal(msg)
    end
  end

  test 'debe logguear con un parametro' do
    e = NotImplementedError.new 'Debe implementarse el método mappear'
    travel_to Time.new(2004, 11, 24, 01, 04, 44) do
      msg = "[24-11-2004 01:04:44] #{e.class}: #{e.message}\n#{e.backtrace}"
      @format_logger.formatear(e, nil).must_equal(msg)
    end
  end

  test 'debe formatear el resumen de la importacion' do
    @registros = ['gonza', 'chama', 'fortes', 'panda']
    entidad = 'Agente'
    total_registros = '4'
    registros_exitosos = '3'
    registros_erroneos = '1'
    travel_to Time.new(2004, 11, 24, 01, 04, 44) do
      msg = "Fecha de importacion: 24-11-2004 01:04:44\nEntidad a importar: Agente\nTotal de registros: 4\nRegistros exitosos: 3\nRegistros erroneos: 1\n"
      @format_logger.formatear_resumen(entidad, total_registros, registros_exitosos, registros_erroneos).must_equal(msg)
    end
  end

end
