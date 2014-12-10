class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.string :telefono
      t.string :email
      t.references :agente, index: true

      t.timestamps
    end
  end
end
