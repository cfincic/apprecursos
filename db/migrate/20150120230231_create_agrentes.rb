class CreateAgrentes < ActiveRecord::Migration
  def change
    create_table :agrentes do |t|
      t.string :cuil
      t.string :nombre
      t.string :apellido
      t.references :tipo_documento, index: true
      t.string :numero_doc
      t.datetime :fecha_nac
      t.string :lugar_nac
      t.string :nacionalidad
      t.string :estado_civil
      t.boolean :es_discapacitado
      t.datetime :expira_certificado

      t.timestamps
    end
  end
end
