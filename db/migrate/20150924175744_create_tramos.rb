class CreateTramos < ActiveRecord::Migration
  def change
    create_table :tramos do |t|
      t.text :descripcion

      t.timestamps
    end
  end
end
