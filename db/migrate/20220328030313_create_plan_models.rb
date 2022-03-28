class CreatePlanModels < ActiveRecord::Migration[7.0]
  def change
    create_table :plan_models do |t|
      #t.integer :id
      t.string :name
      t.text :data
      t.integer :creator
      t.string :editPermission
      t.string :viewPermission
      t.string :extra1
      t.string :extra2
      t.string :extra3

      t.timestamps
    end
  end
end
