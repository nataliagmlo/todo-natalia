class AddProyectIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :proyect_id, :integer

  end
end
