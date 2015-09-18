# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach(Rails.root + 'config/provincias.csv', headers: true) do |row|
  Provincia.skip_callback(:create)
  @prov = Provincia.new(codigo: row[1].squish, detalle: row[2].squish)
  @prov.save(:validate => false)
  Provincia.set_callback(:create)
end

CSV.foreach(Rails.root + 'config/localidades.csv', headers: true) do |row|
  Localidad.skip_callback(:create)
  @prov = Provincia.find_by(codigo: row[3].squish)
  @prov.localidades.create!(codigo: row[0].squish, detalle: row[1].squish)
  Localidad.set_callback(:create)
end

@tipo_documento = TipoDocumento.create!(tipo: "D.N.I")

Agente.create!(cuil: "20285524236", nombre: "Juan", apellido: "acosta", 
			   num_legajo: "25545255", tipo_documento_id: @tipo_documento, numero_doc: "2154556989",
			   fecha_nac: DateTime.now, lugar_nac: "caba", nacionalidad: "argentino", estado_civil: "soltero", 
			   telefono_casa: "45522125", telefono_celu: "1544142525",
			   email: "juan@temira.com", direccion: "av rivadavia 5666", localidad_id: 1, cod_postal: "1200", provincia_id: 1, 
			   otro: "nada", es_discapacitado: false)


@sede1 = Sede.create!(descripcion: "Cordoba", direccion:"cordiba 1150", telefono1: "45225-3223", telefono2: "4412-5523" )
@sede2 = Sede.create!(descripcion: "Cordoba rrhh", direccion:" cordoba 4556", telefono1: "45225-3422", telefono2: "4657-6678" )



