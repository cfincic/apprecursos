class CreateAgentes < ActiveRecord::Migration
  def change
    create_table :agentes do |t|
      t.integer :legajo
      t.string :nombre
      t.string :apellido

      t.timestamps
    end
  end
end
