class CreateSituacionRevista < ActiveRecord::Migration
  def change
    create_table :situacion_revista do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
