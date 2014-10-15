class AddCorrectAnswersColumnToTestInstances < ActiveRecord::Migration
  def change
    add_column :test_instances, :questions_correct, :integer, array: true
  end
end
