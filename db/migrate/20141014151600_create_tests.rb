class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :title
      t.text :description
      t.string :created_at
      t.string :updated_at
      t.integer :attempt
      t.integer :canvas_id
      t.integer :canvas_course_id

      t.timestamps
    end
  end
end
