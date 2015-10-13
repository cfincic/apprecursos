json.array!(@hijos) do |hijo|
  json.extract! hijo, :id, :agente_id, :nombre, :apellido, :fecha_nac, :tipo_doc1, :num_doc1, :tipo_doc2, :num_doc2
  json.url hijo_url(hijo, format: :json)
end
