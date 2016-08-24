require "test_helper"

describe Agente do
  let(:agente) { agentes(:alfonso) }

  it "debe ser valido" do
    agente.must_be :valid?
  end

  describe 'tipo de documento' do
    it 'debe estar presente' do
      agente.tipo_documento = nil
      agente.wont_be :valid?
    end
  end

  describe 'provincia' do
    it 'debe estar presente' do
      agente.provincia = nil
      agente.wont_be :valid?
    end
  end

  describe 'localidad' do
    it 'debe estar presente' do
      agente.localidad = nil
      agente.wont_be :valid?
    end
  end

  describe 'estado de agente' do
    it 'debe estar presente' do
      agente.estado_agente = nil
      agente.wont_be :valid?
    end
  end

end
