class CreateTipoContrataciones < ActiveRecord::Migration
  def change
    create_table :tipo_contrataciones do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
