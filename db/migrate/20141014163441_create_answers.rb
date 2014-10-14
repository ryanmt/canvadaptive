class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.boolean :correct
      t.text :text
      t.timestamps
    end
    add_reference :answers, :question, index: true
  end
end
