class CreateTestings < ActiveRecord::Migration
  def change
    create_table :testings do |t|

      t.timestamps
    end
  end
end
