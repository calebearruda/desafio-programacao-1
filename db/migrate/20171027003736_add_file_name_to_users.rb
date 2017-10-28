class AddFileNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :file, :string
    add_column :users, :name, :string
  end
end
