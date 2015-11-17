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

@tipo_documento = TipoDocumento.create!(tipo: "DNI")
@tipo_documento1 = TipoDocumento.create!(tipo: "CUIT")
@tipo_documento2 = TipoDocumento.create!(tipo: "CUIL")
@tipo_documento3 = TipoDocumento.create!(tipo: "PASAPORTE")
@tipo_documento4 = TipoDocumento.create!(tipo: "CEDULA")


@areaDirGral = Area.create!(descripcion: "Direccion General", jefe: "Rubens Correa", esdire: true)
@areaDirAdmin = Area.create!(descripcion: "Direccion de Administracion", jefe: "Ana Belaustegui", esdire: true, area_id: @areaDirGral.id)
@areaSistemas = Area.create!(descripcion: "Sistemas", jefe: "Christian Fincic", esdire: false, area_id: @areaDirAdmin.id)
@areaTesoreria = Area.create!(descripcion: "Tesoreria", jefe: "Ana Martin", esdire: false, area_id: @areaDirAdmin.id)


@sede1 = Sede.create!(descripcion: "CORDOBA")
@sede2 = Sede.create!(descripcion: "PARAGUAY")
@sede3 = Sede.create!(descripcion: "HISTORICO")
@sede4 = Sede.create!(descripcion: "ANEXO")

@EstadoAgente1 = EstadoAgente.create!(descripcion: "Activo")
@EstadoAgente2 = EstadoAgente.create!(descripcion: "Inactivo")

@tipo_contratacion1 = TipoContratacion.create!(descripcion: "ARTICULO 9")
@tipo_contratacion2 = TipoContratacion.create!(descripcion: "PLANTA PERMANENTE")
@tipo_contratacion3 = TipoContratacion.create!(descripcion: "LOCACION DE OBRA")
@tipo_contratacion4 = TipoContratacion.create!(descripcion: "LOCACION DE SERVICIO")

@acto_administrativo1 = ActoAdministrativo.create!(descripcion: "dictamen")
@acto_administrativo2 = ActoAdministrativo.create!(descripcion: "decreto")
@acto_administrativo3 = ActoAdministrativo.create!(descripcion: "resolucion")
@acto_administrativo4 = ActoAdministrativo.create!(descripcion: "desicion administrativa")

@agrupamiento1 = Agrupamiento.create!(descripcion: "general")
@agrupamiento2 = Agrupamiento.create!(descripcion: "profesional")

@tramo1 = Tramo.create!(descripcion: "inicial")
@tramo2 = Tramo.create!(descripcion: "intermedio")
@tramo3 = Tramo.create!(descripcion: "avanzado")

Agente.create!(estado_agente: @EstadoAgente1, cuil: "20285524236", nombre: "Juan", apellido: "acosta", 
			   num_legajo: "25545255", tipo_documento: @tipo_documento, numero_doc: "2154556989",
			   fecha_nac: DateTime.now, lugar_nac: "caba", nacionalidad: "argentino", estado_civil: "soltero", 
			   telefono_casa: "45522125", telefono_celu: "1544142525", email: "juan@temira.com", 
         direccion: "av rivadavia 5666", localidad_id: 1, cod_postal: "1200", provincia_id: 1, 
			   otro: "nada", es_discapacitado: false)




