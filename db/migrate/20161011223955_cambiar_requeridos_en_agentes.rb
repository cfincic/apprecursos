class CambiarRequeridosEnAgentes < ActiveRecord::Migration
  def change
    change_column_null(:agentes, :tipo_documento_id, :integer )
    change_column_null(:agentes, :localidad_id, :integer )
    change_column_null(:agentes, :provincia_id, :integer )
    change_column_null(:agentes, :estado_agente_id, :integer )
  end
end
