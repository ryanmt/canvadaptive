class RenameCanvasIdToCanvasUserIdToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :canvas_id, :canvas_user_id
  end
end
