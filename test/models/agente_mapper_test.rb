require "test_helper"

class AgenteMapperTest < ActiveSupport::TestCase

  def setup
    @agente_vacio ||= Agente.new
    @agente_mapper ||= AgenteMapper.new
    @registro ||= { cuil: '20-28463548-6', nombre: 'Diego', apellido: 'Tanel', num_legajo: 2, tipo_documento: 'DNI', localidad: 'CABA', estado_agente: 'T', numero_doc: '28.463.548', fecha_nac: '29/10/80', fecha_antecedentes_penales: '16/10/2015', lugar_nac: 'morón', nacionalidad: 'Argentina', estado_civil: 'Soltero', telefono_casa: '4855', telefono_celu: '154', email: 'dtanel@gmail.com', direccion: 'araoz', cod_postal: '1414', provincia: 'Chaco', email2: 'd_tanel@hotmail.com', es_discapacitado: true, expira_certificado: '27/05/2016' }
  end

  def teardown
    @agente_vacio.destroy!
  end

  test 'debe responder a mappear' do
    @agente_mapper.must_respond_to :mappear
  end

  test 'asignacion de legajo' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.num_legajo.must_equal(2)
  end

  test 'asignacion de cuil' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.cuil.must_equal('20284635486')
  end

  test 'asignacion de nombre' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.nombre.must_equal('Diego')
  end

  test 'asignacion de nombre con las keys en mayuscula' do
    @registro[:NOMBRE] = 'Gonza'
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.nombre.must_equal('Gonza')
  end

  test 'asignacion de nombre con las keys como strings' do
    @registro['nombre'] = 'Gonza'
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.nombre.must_equal('Gonza')
  end

  test 'asignacion de nombre con las keys como strings y mayuscula' do
    @registro['NOMBRE'] = 'Gonza'
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.nombre.must_equal('Gonza')
  end

  test 'asignacion de apellido' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.apellido.must_equal('Tanel')
  end

  test 'asignacion de tipo de documento' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.tipo_documento.tipo.must_equal('dni')
  end

  test 'asignacion de tipo de documento insesitive case' do
    @registro[:tipo_documento] = 'DNI'
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.tipo_documento.tipo.must_equal('dni')
  end

  test 'asignacion de tipo de documento no existente' do
    @registro[:tipo_documento] = 'fruta'
    e = proc{ @agente_mapper.mappear(@agente_vacio, @registro) }.must_raise ActiveRecord::RecordNotFound
    e.message.must_equal('El tipo de documento no existe')
  end

  test 'asignacion de tipo de documento nulo' do
    @registro[:tipo_documento] = nil
    e = proc{ @agente_mapper.mappear(@agente_vacio, @registro) }.must_raise ActiveRecord::RecordNotFound
    e.message.must_equal('El tipo de documento no puede ser nulo')
  end

  test 'asignacion de tipo de documento vacio' do
    @registro[:tipo_documento] = ''
    e = proc{ @agente_mapper.mappear(@agente_vacio, @registro) }.must_raise ActiveRecord::RecordNotFound
    e.message.must_equal('El tipo de documento no puede ser nulo')
  end

  test 'asignacion de localidad' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.localidad.detalle.must_equal('CABA')
  end

  test 'asignacion de localidad insesitive case' do
    @registro[:localidad] = 'caba'
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.localidad.detalle.must_equal('CABA')
  end

  test 'asignacion de localidad con acento' do
    @registro[:localidad] = 'moron'
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.localidad.detalle.must_equal('Morón')
  end

  test 'asignacion de una localidad en distintas provincias' do
    @registro[:provincia] = 'Salta'
    @registro[:localidad] = 'conesa'
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.localidad.detalle.must_equal('Conesa')
    agente.localidad.provincia.detalle.must_equal('Salta')
  end

  test 'asignacion de localidad con mas de un nombre similares' do
    @registro[:provincia] = 'BUENOS AIRES'
    @registro[:localidad] = 'laferrere'
    e = proc { @agente_mapper.mappear(@agente_vacio, @registro) }.must_raise ActiveRecord::RecordNotFound
    e.message.must_equal('Existen más de dos resultados coincidentes para la entidad Localidad con los resultados: Gregorio de Laferrere, Jose Laferrere')
  end

  test 'asignacion de localidad no existente' do
    @registro[:localidad] = 'fruta'
    e = proc { @agente_mapper.mappear(@agente_vacio, @registro) }.must_raise ActiveRecord::RecordNotFound
    e.message.must_equal('La localidad no existe')
  end

  test 'asignacion de localidad nula' do
    @registro[:localidad] = nil
    e = proc{ @agente_mapper.mappear(@agente_vacio, @registro) }.must_raise ActiveRecord::RecordNotFound
    e.message.must_equal('La localidad no puede ser nula')
  end

  test 'asignacion de localidad vacio' do
    @registro[:localidad] = ''
    e = proc{ @agente_mapper.mappear(@agente_vacio, @registro) }.must_raise ActiveRecord::RecordNotFound
    e.message.must_equal('La localidad no puede ser nula')
  end

  test 'asignacion de provincia' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.provincia.detalle.must_equal('Chaco')
  end

  test 'asignacion de provincia insesitive case' do
    @registro[:provincia] = 'CHACO'
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.provincia.detalle.must_equal('Chaco')
  end

  test 'asignacion de provincia con acento' do
    @registro[:provincia] = 'Tucuman'
    @registro[:localidad] = 'algo de tucuman'
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.provincia.detalle.must_equal('Tucumán')
  end

  test 'asignacion de provincia no existente' do
    @registro[:provincia] = 'fruta'
    e = proc { @agente_mapper.mappear(@agente_vacio, @registro) }.must_raise ActiveRecord::RecordNotFound
    e.message.must_equal('La provincia no existe')
  end

  test 'asignacion de provincia nula' do
    @registro[:provincia] = nil
    e = proc { @agente_mapper.mappear(@agente_vacio, @registro) }.must_raise ActiveRecord::RecordNotFound
    e.message.must_equal('La provincia no puede ser nula')
  end

  test 'asignacion de provincia vacia' do
    @registro[:provincia] = ''
    e = proc { @agente_mapper.mappear(@agente_vacio, @registro) }.must_raise ActiveRecord::RecordNotFound
    e.message.must_equal('La provincia no puede ser nula')
  end

  test 'asignacion de estado de agente activo' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.estado_agente.descripcion.must_equal('Activo')
  end

  test 'asignacion de estado de agente inactivo' do
    @registro[:estado_agente] = 'F'
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.estado_agente.descripcion.must_equal('Inactivo')
  end

  test 'asignacion de estado de agente insesitive case' do
    @registro[:estado_agente] = 'f'
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.estado_agente.descripcion.must_equal('Inactivo')
  end

  test 'asignacion de estado de agente no existente' do
    @registro[:estado_agente] = 'fruta'
    e = proc{ @agente_mapper.mappear(@agente_vacio, @registro) }.must_raise ActiveRecord::RecordNotFound
    e.message.must_equal('El valor del agente debe ser T o F')
  end

  test 'asignacion de estado de agente nulo' do
    @registro[:estado_agente] = nil
    e = proc{ @agente_mapper.mappear(@agente_vacio, @registro) }.must_raise ActiveRecord::RecordNotFound
    e.message.must_equal('El agente no puede ser nulo')
  end

  test 'asignacion de estado de agente vacio' do
    @registro[:estado_agente] = ''
    e = proc{ @agente_mapper.mappear(@agente_vacio, @registro) }.must_raise ActiveRecord::RecordNotFound
    e.message.must_equal('El agente no puede ser nulo')
  end

  test 'asignacion de numero de documento' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.numero_doc.must_equal('28.463.548')
  end

  test 'asignacion de fecha de nacimiento' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.fecha_nac.to_s.must_equal('1980-10-29')
  end

  test 'asignacion de fecha de nacimiento nula' do
    @registro[:fecha_nac] = nil
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.fecha_nac.must_be_nil
  end

  test 'asignacion de fecha de antecedentes penales' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.fecha_antecedentes_penales.to_s.must_equal('2015-10-16 00:00:00 -0300')
  end

  test 'asignacion de fecha de antecedentes penales nulo' do
    @registro[:fecha_antecedentes_penales] = nil
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.fecha_antecedentes_penales.must_be_nil
  end

  test 'asignacion de fecha de antecedentes penales vacio' do
    @registro[:fecha_antecedentes_penales] = ''
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.fecha_antecedentes_penales.must_be_nil
  end

  test 'asignacion de lugar de nacimiento' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.lugar_nac.to_s.must_equal('morón')
  end

  test 'asignacion de nacionalidad' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.nacionalidad.must_equal('Argentina')
  end

  test 'asignacion de estado civil' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.estado_civil.must_equal('Soltero')
  end

  test 'asignacion de telefono casa' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.telefono_casa.must_equal('4855')
  end

  test 'asignacion de telefono celular' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.telefono_celu.must_equal('154')
  end

  test 'asignacion de email' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.email.must_equal('dtanel@gmail.com')
  end

  test 'asignacion de direccion' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.direccion.must_equal('araoz')
  end

  test 'asignacion de codigo postal' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.cod_postal.must_equal('1414')
  end

  test 'asignacion de email2' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.email2.must_equal('d_tanel@hotmail.com')
  end

  test 'asignacion de es discapacitado' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.es_discapacitado.must_equal(true)
  end

  test 'asignacion de expira certificado' do
    agente = @agente_mapper.mappear(@agente_vacio, @registro)
    agente.expira_certificado.to_s.must_equal('2016-05-27')
  end
end
