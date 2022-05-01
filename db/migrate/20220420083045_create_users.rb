class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :level
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest
      t.string :viewPermission
      t.string :editPermission
      t.text :description
      t.string :extra1
      t.string :extra2
      t.string :extra3

      t.timestamps
      
    end
  end
end
