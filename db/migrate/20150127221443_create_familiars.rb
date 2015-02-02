class CreateFamiliars < ActiveRecord::Migration
  def change
    create_table :familiars do |t|
      t.string :relacion
      t.string :cuil
      t.string :nombre
      t.string :apellido
      t.datetime :fecha_nac
      t.string :lugar_nac
      t.references :agrente, index: true

      t.timestamps
    end
  end
end
