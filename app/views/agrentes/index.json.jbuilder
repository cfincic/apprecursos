json.array!(@agrentes) do |agrente|
  json.extract! agrente, :id, :cuil, :nombre, :apellido, :TipoDocumento_id, :numero_doc, :fecha_nac, :lugar_nac, :nacionalidad, :estado_civil, :es_discapacitado, :expira_certificado
  json.url agrente_url(agrente, format: :json)
end
