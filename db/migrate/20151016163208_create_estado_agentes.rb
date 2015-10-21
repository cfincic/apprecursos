class CreateEstadoAgentes < ActiveRecord::Migration
  def change
    create_table :estado_agentes do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
