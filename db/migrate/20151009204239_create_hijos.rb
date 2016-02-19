class CreateHijos < ActiveRecord::Migration
  def change
    create_table :hijos do |t|
      t.references :agente, index: true
      t.string :nombre
      t.string :apellido
      t.date :fecha_nac
      t.references :tipo_doc1
      t.string :num_doc1

      t.timestamps
    end
  end
end