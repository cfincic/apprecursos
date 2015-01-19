json.array!(@situacion_revista) do |situacion_revistum|
  json.extract! situacion_revistum, :id, :descripcion
  json.url situacion_revistum_url(situacion_revistum, format: :json)
end
