require "test_helper"

class ImportadorAgenteTest < ActiveSupport::TestCase

  def setup
    @importador_agente ||= ImportadorAgente.new
    @tipo_doc ||= tipo_documentos(:dni)
  end

  def teardown
    # File.delete(@ruta_log) if File.exist?(@ruta_log)
  end

  test 'debe responder a importar' do
    @importador_agente.must_respond_to :importar
  end

  test 'debe importar un agente' do
    a = Agente.where(apellido: 'ALAMO')
    a.first.must_be_nil
    @importador_agente.importar
    a = Agente.where(apellido: 'ALAMO')
    a.first.wont_be_nil
  end

end
