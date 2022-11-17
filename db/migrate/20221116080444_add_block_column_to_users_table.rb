class AddBlockColumnToUsersTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_block, :boolean, default: true 
  end
end
