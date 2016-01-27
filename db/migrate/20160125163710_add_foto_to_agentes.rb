class AddFotoToAgentes < ActiveRecord::Migration
  def up
    add_attachment :agentes, :foto
  end

  def down
    remove_attachment :agentes, :foto
  end
end
