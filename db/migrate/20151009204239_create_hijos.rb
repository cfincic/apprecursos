class CreateHijos < ActiveRecord::Migration
  def change
    create_table :hijos do |t|
      t.references :agente, index: true
      t.string :nombre
      t.string :apellido
      t.date :fecha_nac
      t.string :tipo_doc1
      t.string :num_doc1
      t.string :tipo_doc2
      t.string :num_doc2

      t.timestamps
    end
  end
end
