class CreatePeriodosDeContratacion < ActiveRecord::Migration
  def change
    create_table :periodos_de_contratacion do |t|
      t.datetime :fecha_desde
      t.datetime :fecha_hasta
      t.references :dato_laboral, index: true

      t.timestamps
    end
  end
end
