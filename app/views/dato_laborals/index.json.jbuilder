json.array!(@dato_laborals) do |dato_laboral|
  json.extract! dato_laboral, :id, :agrente_id, :num_legajo, :sede, :interno, :fecha_ingreso, :situ_revista, :agrupamiento, :nivel, :grado, :tramo, :cargo, :obj_cargo, :tareas_cargo, :depende_direccion, :jefe_directo, :sueldo_bruto, :sueldo_neto, :cant_personas_acargo
  json.url dato_laboral_url(dato_laboral, format: :json)
end
