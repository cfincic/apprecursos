class ChangeFieldFromDatetimeToDate < ActiveRecord::Migration
  def change
    change_column :agentes, :expira_certificado, :date
    change_column :agentes, :fecha_nac, :date
  end
end
