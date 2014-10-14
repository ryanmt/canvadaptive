class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :canvas_id
      t.text :name
      t.text :text
      t.integer :points_possible
      t.integer :difficulty
      t.integer :asked_count
      t.integer :correct_count
      t.text :question_type
      t.references :test

      t.timestamps
    end
  end
end
