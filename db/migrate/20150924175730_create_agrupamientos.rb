class CreateAgrupamientos < ActiveRecord::Migration
  def change
    create_table :agrupamientos do |t|
      t.text :descripcion

      t.timestamps
    end
  end
end
