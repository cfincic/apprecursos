class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :descripcion
      t.string :jefe
      t.boolean :esdire
      t.string :madre
      t.references :area

      t.timestamps
    end
  end
end
