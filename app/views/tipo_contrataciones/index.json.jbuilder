json.array!(@tipo_contrataciones) do |tipo_contratacion|
  json.extract! tipo_contratacion, :id, :descripcion
  json.url tipo_contratacion_url(tipo_contratacion, format: :json)
end
