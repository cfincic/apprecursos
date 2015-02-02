json.array!(@familiars) do |familiar|
  json.extract! familiar, :id, :relacion, :cuil, :nombre, :apellido, :fecha_nac, :lugar_nac, :agrente_id
  json.url familiar_url(familiar, format: :json)
end
