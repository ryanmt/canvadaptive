class CreateLtiLaunches < ActiveRecord::Migration
  def change
    create_table :lti_launches do |t|
      t.text :data

      t.timestamps
    end
  end
end
