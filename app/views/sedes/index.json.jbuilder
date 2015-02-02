json.array!(@sedes) do |sede|
  json.extract! sede, :id, :descripcion, :direccion, :telefono1, :telefono2
  json.url sede_url(sede, format: :json)
end
