class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :age, :integer
    add_column :users, :address, :string
    add_column :users, :mobile, :integer
    add_column :users, :profession, :string
    
    add_index :users, :name, unique: true
    add_index :users, :email, unique: true
  end
end
