json.array!(@agentes) do |agente|
  json.extract! agente, :id, :cuil, :nombre, :apellido, :tipoDocumento_id, :numero_doc, :fecha_nac, :lugar_nac, :nacionalidad, :estado_civil, :es_discapacitado, :expira_certificado
  json.url agente_url(agente, format: :json)
end
