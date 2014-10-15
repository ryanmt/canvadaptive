class AddAttributeToUser < ActiveRecord::Migration
  def change
    add_column :users, :ability, :float
  end
end
