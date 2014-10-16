class AddCanvasUserIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :canvas_id, :integer
  end
end
