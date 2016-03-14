class AddNuevasColumnasToDatoLaborals < ActiveRecord::Migration
  def change
    add_column :dato_laborals, :nro_acto, :string
    add_column :dato_laborals, :fecha_examen_periodico, :datetime
    add_column :dato_laborals, :fecha_entrega, :datetime
    add_column :dato_laborals, :hora_desde, :string
    add_column :dato_laborals, :hora_hasta, :string
  end
end
