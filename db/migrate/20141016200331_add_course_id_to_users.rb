class AddCourseIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :canvas_course_id, :integer
  end
end
