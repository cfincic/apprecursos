require "test_helper"

describe Agente do
  let(:agente) { agentes(:alfonso) }

  test 'debe ser valido' do
    agente.must_be :valid?
  end

  describe 'número de legajo' do
    test 'debe estar presente' do
      agente.num_legajo = nil
      agente.wont_be :valid?
      agente.errors.full_messages.first.must_equal('Num legajo no puede estar en blanco')
    end

    test 'debe ser numérico' do
      agente.num_legajo = 'a' * 5
      agente.wont_be :valid?
      agente.errors.full_messages.first.must_equal('Num legajo no es un número')
    end

    test 'debe ser único' do
      agente2 = agente.dup
      agente2.cuil = '20141662148'
      agente2.save
      agente2.wont_be :valid?
      agente2.errors.full_messages.first.must_equal('Num legajo ya ha sido tomado')
    end
  end

  describe 'tipo de documento' do
    test 'debe estar presente' do
      agente.tipo_documento = nil
      agente.wont_be :valid?
    end
  end

  describe 'provincia' do
    test 'debe estar presente' do
      agente.provincia = nil
      agente.wont_be :valid?
    end
  end

  describe 'localidad' do
    test 'debe estar presente' do
      agente.localidad = nil
      agente.wont_be :valid?
    end
  end

  describe 'estado de agente' do
    test 'debe estar presente' do
      agente.estado_agente = nil
      agente.save
      agente.wont_be :valid?
    end
  end

  describe 'CUIL' do
    test 'debe estar presente' do
      agente.cuil = nil
      agente.wont_be :valid?
      agente.errors.full_messages.first.must_equal('Cuil no puede estar en blanco')
    end

    test 'debe ser solo numérico' do
      agente.cuil = 'a' * 11
      agente.wont_be :valid?
      agente.errors.full_messages.first.must_equal('Cuil no es un número')
    end

    test 'debe tener 11 caracteres (de menos)' do
      agente.cuil = '12345'
      agente.wont_be :valid?
      agente.errors.full_messages.first.must_equal('Cuil longitud errónea (debe ser de 11 caracteres)')
    end

    test 'debe tener 11 caracteres (de más)' do
      agente.cuil = '12345678901234'
      agente.wont_be :valid?
      agente.errors.full_messages.first.must_equal('Cuil longitud errónea (debe ser de 11 caracteres)')
    end

    test 'debe ser único' do
      agente2 = agente.dup
      agente2.num_legajo = '4424'
      agente2.save
      agente2.wont_be :valid?
      agente2.errors.full_messages.first.must_equal('Cuil ya ha sido tomado')
    end

    test 'debe estar bien formado' do
      agente.cuil = '12345678901'
      agente.wont_be :valid?
      agente.errors.full_messages.first.must_equal('Cuil debe estar formado correctamente')
    end

    test 'debe ser sin guiones' do
      agente.cuil = nil
      agente.wont_be :valid?
      agente.cuil = '20-28463548-6'
      agente.must_be :valid?
      agente.cuil.must_equal('20284635486')
    end
  end

end
