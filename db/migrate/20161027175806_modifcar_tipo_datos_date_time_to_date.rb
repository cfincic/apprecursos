class ModifcarTipoDatosDateTimeToDate < ActiveRecord::Migration
  def change
    change_column :dato_laborals, :fecha_ingreso, :date
    change_column :dato_laborals, :fecha_acto, :date
    change_column :dato_laborals, :fecha_apto_fisico, :date
    change_column :dato_laborals, :fecha_curriculum, :date
    change_column :dato_laborals, :fecha_antecedentes_penales, :date
    change_column :dato_laborals, :fecha_examen_periodico, :date
    change_column :dato_laborals, :fecha_entrega, :date
  end
end
