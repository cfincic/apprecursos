class RemoveProvinciaFromAgente < ActiveRecord::Migration
  def change
    remove_column :agentes, :provincia
  end
end
