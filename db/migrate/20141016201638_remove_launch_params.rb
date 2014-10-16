class RemoveLaunchParams < ActiveRecord::Migration
  def change
    drop_table :launch_params
  end
end
