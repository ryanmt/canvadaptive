class AddMoreAttributesToTestInstances < ActiveRecord::Migration
  def change
    add_reference :test_instances, :test, index: true
    add_column :test_instances, :ability, :integer
    add_column :test_instances, :questions_asked, :integer, array: true
  end
end
