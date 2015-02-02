class CreateSedes < ActiveRecord::Migration
  def change
    create_table :sedes do |t|
      t.string :descripcion
      t.string :direccion
      t.string :telefono1
      t.string :telefono2

      t.timestamps
    end
  end
end
