json.array!(@agentes) do |agente|
  json.extract! agente, :id, :legajo, :nombre, :apellido
  json.url agente_url(agente, format: :json)
end
