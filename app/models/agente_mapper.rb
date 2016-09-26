class AgenteMapper < AbstractMapper

  def mappear(agente, registro)
    reg = simbolizar_minimizar(registro)
    agente.num_legajo = reg[:num_legajo]
    agente.cuil = reg[:cuil]
    agente.nombre = reg[:nombre]
    agente.apellido = reg[:apellido]
    agente.tipo_documento = obtener_tipo_de_documento(reg[:tipo_documento])
    agente.provincia = obtener_provincia(reg[:provincia])
    agente.localidad = obtener_localidad(reg[:localidad])
    agente.estado_agente = obtener_estado_agente(reg[:estado_agente])
    agente.numero_doc = reg[:numero_doc]
    agente.fecha_nac = obtener_fecha_nac(reg[:fecha_nac])
    agente.fecha_antecedentes_penales = reg[:fecha_antecedentes_penales]
    agente.lugar_nac = reg[:lugar_nac]
    agente.nacionalidad = reg[:nacionalidad]
    agente.estado_civil = reg[:estado_civil]
    agente.telefono_casa = reg[:telefono_casa]
    agente.telefono_celu = reg[:telefono_celu]
    agente.email = reg[:email]
    agente.direccion = reg[:direccion]
    agente.cod_postal = reg[:cod_postal]
    agente.email2 = reg[:email2]
    agente.es_discapacitado = reg[:es_discapacitado]
    agente.expira_certificado = reg[:expira_certificado]
    agente
  end

  private

  def simbolizar_minimizar(registro)
    registro.to_hash.with_indifferent_access.deep_transform_keys!{ |key| key.downcase }
  end

  def obtener_tipo_de_documento(etiqueta)
    msg_err_nulo = 'El tipo de documento no puede ser nulo'
    msg_error_inexistente = 'El tipo de documento no existe'
    klass = TipoDocumento
    field = 'tipo'
    obtener_datos_precargados(etiqueta, klass, field, msg_err_nulo, msg_error_inexistente)
  end

  def obtener_localidad(etiqueta)
    msg_err_nulo = 'La localidad no puede ser nula'
    msg_error_inexistente = 'La localidad no existe'
    klass = Localidad
    field = 'detalle'
    obtener_datos_precargados(etiqueta, klass, field, msg_err_nulo, msg_error_inexistente)
  end

  def obtener_provincia(etiqueta)
    msg_err_nulo = 'La provincia no puede ser nula'
    msg_error_inexistente = 'La provincia no existe'
    klass = Provincia
    field = 'detalle'
    obtener_datos_precargados(etiqueta, klass, field, msg_err_nulo, msg_error_inexistente)
  end

  def obtener_estado_agente(etiqueta_agente)
    if etiqueta_agente.blank?
      raise ActiveRecord::RecordNotFound, 'El agente no puede ser nulo'
    elsif etiqueta_agente == 'T' or etiqueta_agente == 't'
      descripcion = 'Activo'
    elsif etiqueta_agente == 'F' or etiqueta_agente == 'f'
      descripcion = 'Inactivo'
    else
      raise ActiveRecord::RecordNotFound, 'El valor del agente debe ser T o F'
    end
    EstadoAgente.where("lower(descripcion) = ?", descripcion.downcase).first!
  end

  def obtener_fecha_nac(fecha)
    Date.strptime(fecha, '%d/%m/%y') unless fecha.blank?
  end

  def obtener_datos_precargados(etiqueta, klass, field, msg_err_nulo, msg_error_inexistente)
    raise ActiveRecord::RecordNotFound, msg_error_inexistente if etiqueta.blank?
    r = klass.where("lower(#{field}) = ?", etiqueta.downcase).first
    r ? r : raise(ActiveRecord::RecordNotFound, msg_error_inexistente)
  end
end
