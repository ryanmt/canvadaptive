class CreateTestInstances < ActiveRecord::Migration
  def change
    create_table :test_instances do |t|
      t.integer :attempt_id
      t.timestamps
    end
    add_reference :test_instances, :user, index: true
  end
end
