class CreateDatoLaborals < ActiveRecord::Migration
  def change
    create_table :dato_laborals do |t|
      t.references :agrente, index: true
      t.integer :sede
      t.integer :interno
      t.date :fecha_ingreso
      t.integer :situ_revista
      t.string :agrupamiento
      t.string :nivel
      t.string :grado
      t.string :tramo
      t.string :cargo
      t.text :obj_cargo
      t.text :tareas_cargo
      t.string :depende_direccion
      t.integer :jefe_directo
      t.decimal :sueldo_bruto
      t.decimal :sueldo_neto
      t.integer :cant_personas_acargo

      t.timestamps
    end
  end
end
