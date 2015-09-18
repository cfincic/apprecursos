class CreateAgentes < ActiveRecord::Migration
  def change
    create_table :agentes do |t|
      t.string :cuil
      t.string :nombre
      t.string :apellido
      t.integer :num_legajo
      t.references :tipo_documento, index: true
      t.references :localidad, index: true
      t.references :provincia, index: true
      t.string :numero_doc
      t.datetime :fecha_nac
      t.string :lugar_nac
      t.string :nacionalidad
      t.string :estado_civil
      t.string :telefono_casa
      t.string :telefono_celu
      t.string :email
      t.string :direccion      
      t.string :cod_postal
      t.string :provincia
      t.string :otro
      t.boolean :es_discapacitado
      t.datetime :expira_certificado

      t.timestamps
    end
  end
end
