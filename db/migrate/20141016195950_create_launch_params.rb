class CreateLaunchParams < ActiveRecord::Migration
  def change
    create_table :launch_params do |t|
      t.text :params
      t.references :user, index: true

      t.timestamps
    end
  end
end
