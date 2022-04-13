class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :level
      t.string :name
      t.string :password
      t.string :email
      t.text :description
      t.string :extra1
      t.string :extra2
      t.string :extra3

      t.timestamps
    end
    add_index :users, :email
  end
end
