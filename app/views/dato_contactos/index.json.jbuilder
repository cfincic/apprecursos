json.array!(@dato_contactos) do |dato_contacto|
  json.extract! dato_contacto, :id, :telefono_casa, :telefono_celu, :email, :direccion, :ciudad, :cod_postal, :provincia, :otro, :agrente_id
  json.url dato_contacto_url(dato_contacto, format: :json)
end
