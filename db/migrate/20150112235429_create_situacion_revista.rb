class CreateSituacionRevista < ActiveRecord::Migration
  def change
    create_table :situacion_revista do |t|
      t.string :descripcion
	  t.datetime :fecha_alta
	  t.references :dato_laboral
      t.timestamps
    end
  end
end
