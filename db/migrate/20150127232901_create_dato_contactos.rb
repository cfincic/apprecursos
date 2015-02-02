class CreateDatoContactos < ActiveRecord::Migration
  def change
    create_table :dato_contactos do |t|
      t.string :telefono_casa
      t.string :telefono_celu
      t.string :email
      t.string :direccion
      t.string :ciudad
      t.string :cod_postal
      t.string :provincia
      t.string :otro
      t.references :agrente, index: true

      t.timestamps
    end
  end
end
