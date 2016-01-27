class CreateSituacionRevistas < ActiveRecord::Migration
  def change
    create_table :situacion_revistas do |t|
    t.string :descripcion
	  t.datetime :fecha_alta
	  t.datetime :fecha_baja
	  t.references :dato_laboral
	  t.references :tipo_contratacion
      t.timestamps
    end
  end
end
