class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :email
      t.decimal:article_counter

      t.timestamps null: false
    end
  end
end
