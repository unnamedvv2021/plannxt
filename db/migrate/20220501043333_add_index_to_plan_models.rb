class AddIndexToPlanModels < ActiveRecord::Migration[7.0]
  def change
    add_index :plan_models, :creator
  end
end
