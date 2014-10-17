class AddReferencetoTestsToTestInstances < ActiveRecord::Migration
  def change
    add_reference :tests, :test_instances, index: true
  end
end
