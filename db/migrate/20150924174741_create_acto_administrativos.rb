class CreateActoAdministrativos < ActiveRecord::Migration
  def change
    create_table :acto_administrativos do |t|
      t.text :descripcion

      t.timestamps
    end
  end
end
