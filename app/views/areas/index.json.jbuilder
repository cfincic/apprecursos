json.array!(@areas) do |area|
  json.extract! area, :id, :descripcion, :jefe, :esdire, :madre
  json.url area_url(area, format: :json)
end
