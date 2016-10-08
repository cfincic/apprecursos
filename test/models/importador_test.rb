require "test_helper"

class ImportadorTest < ActiveSupport::TestCase

  def setup
    @registros ||= ['gonza', 'chama']
    @proc ||= lambda { |c, r| "#{r}!" }
    @ruta_log = Rails.root.join("log/importacion_prueba.log")
    @importador ||= Importador.new(@ruta_log)
    @clase ||= Object.new
  end

  def teardown
    File.delete(@ruta_log) if File.exist?(@ruta_log)
  end

  test 'debe responder a importar' do
    @importador.must_respond_to :importar
  end

  # test 'debe recorrer el listado' do
  #   importar.must_equal(['gonza!', 'chama!'])
  # end


  test 'No hay registros para procesar' do
    @registros = []
    travel_to Time.new(2004, 11, 24, 01, 04, 44) do
      msg = "[24-11-2004 01:04:44] ArgumentError: No hay registros que recorrer\n"
      importar
      File.read(@ruta_log).must_equal(msg)
    end
  end

  test 'El registro esta nulo' do
    @registros = nil
    travel_to Time.new(2004, 11, 24, 01, 04, 44) do
      msg = "[24-11-2004 01:04:44] ArgumentError: No hay registros que recorrer\n"
      importar
      File.read(@ruta_log).must_equal(msg)
    end
  end

  test 'No hay logica para procesar' do
    @proc = nil
    travel_to Time.new(2004, 11, 24, 01, 04, 44) do
      msg = "[24-11-2004 01:04:44] ArgumentError: No hay lógica para procesar\n"
      importar
      File.read(@ruta_log).must_equal(msg)
    end
  end

  test 'No hay ruta del archivo para loguear' do
    e = proc{ Importador.new(nil) }.must_raise ArgumentError
    e.message.must_equal('No hay ruta del archivo para loguear')
  end

  test 'Loguear excepcion cuando no hay registro' do
    @proc = nil
    travel_to Time.new(2004, 11, 24, 01, 04, 44) do
      msg = "[24-11-2004 01:04:44] ArgumentError: No hay lógica para procesar\n"
      importar
      File.read(@ruta_log).must_equal(msg)
    end
  end

  test 'Se loguea la excepcion cuando se mapea' do
    travel_to Time.new(2004, 11, 24, 01, 04, 44) do
      msg_ex = 'Excepción con un registro erroneo'
      @proc = lambda { |c, r| raise ArgumentError, msg_ex }
      msg = mensaje_logueado_con_errores(msg_ex,0,2)
      importar
      File.read(@ruta_log).must_equal(msg)
    end
  end

  # test 'Verificar que la clase llame al save!' do
  #   @registros = ['gonza']
  #   @clase = MiniTest::Mock.new.expect(:save!, true)
  #   importar
  #   @clase.verify
  # end

  test 'Verificar que el proc llame al call' do
    @registros = ['gonza']
    mock = MiniTest::Mock.new.expect(:fruta, true)
    @proc = lambda { |c, r| mock.fruta }
    importar
    mock.verify
  end

  test 'Loguear datos de la importacion con casos exitosos' do
    def @clase.save!; true end
    travel_to Time.new(2004, 11, 24, 01, 04, 44) do
      msg = "Fecha de importacion: 24-11-2004 01:04:44\nEntidad a importar: #{@clase.class.to_s}\nTotal de registros: #{@registros.count}\nRegistros exitosos: #{@registros.count}\nRegistros erroneos: 0\n"
      importar
      File.read(@ruta_log).must_equal(msg)
    end
  end

  test 'Loguear datos de la importacion con un caso erroneo' do
    def @clase.save!; raise ArgumentError, 'Excepción con un registro' end
    msg_ex = 'Excepción con un registro'
    travel_to Time.new(2004, 11, 24, 01, 04, 44) do
      msg = mensaje_logueado_con_errores(msg_ex,0,2)
      importar
      File.read(@ruta_log).must_equal(msg)
    end
  end

  test 'Loguear datos con errores al mapear con varios registros' do
    @registros = ['gonza', Hash.new, 'fortes', 'panda']
    @proc = lambda { |c, r| r.downcase! }
    def @clase.save!; true end
    travel_to Time.new(2004, 11, 24, 01, 04, 44) do
      msg = "[24-11-2004 01:04:44] Error con el registro {} NoMethodError: undefined method `downcase!' for {}:Hash\n"
      msg << "Fecha de importacion: 24-11-2004 01:04:44\nEntidad a importar: #{@clase.class.to_s}\nTotal de registros: #{@registros.count}\nRegistros exitosos: 3\nRegistros erroneos: 1\n"
      importar
      File.read(@ruta_log).must_equal(msg)
    end
  end

  test 'Loguear datos de la importacion con varios casos erroneos' do
    @registros = ['gonza', 'chama', 'fortes', 'panda']
    @proc = lambda { |c, r|
      if r == 'chama'
        def c.save!; raise ArgumentError, 'Excepción con un registro' end
      else
        def c.save!; true end
      end
    }
    msg_ex = 'Excepción con un registro'
    travel_to Time.new(2004, 11, 24, 01, 04, 44) do
      msg = "[24-11-2004 01:04:44] Error con el registro \"chama\" ArgumentError: #{msg_ex}\n"
      msg << "Fecha de importacion: 24-11-2004 01:04:44\nEntidad a importar: #{@clase.class.to_s}\nTotal de registros: #{@registros.count}\nRegistros exitosos: 3\nRegistros erroneos: 1\n"
      importar
      File.read(@ruta_log).must_equal(msg)
    end
  end

  private

  def importar
    @importador.importar(@clase, @registros, @proc)
  end

  def mensaje_logueado_con_errores(msg_ex, reg_exitosos, reg_erroneos)
    msg = "[24-11-2004 01:04:44] Error con el registro \"gonza\" ArgumentError: #{msg_ex}\n"
    msg << "[24-11-2004 01:04:44] Error con el registro \"chama\" ArgumentError: #{msg_ex}\n"
    msg << "Fecha de importacion: 24-11-2004 01:04:44\nEntidad a importar: #{@clase.class.to_s}\nTotal de registros: #{@registros.count}\nRegistros exitosos: #{reg_exitosos}\nRegistros erroneos: #{reg_erroneos}\n"
  end

end
