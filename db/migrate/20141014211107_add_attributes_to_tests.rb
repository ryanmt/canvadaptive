class AddAttributesToTests < ActiveRecord::Migration
  def change
    add_column :tests, :question_min, :integer
    add_column :tests, :question_max, :integer
    add_column :tests, :mastery_threshold, :float
    add_column :tests, :failure_threshold, :float
  end
end
