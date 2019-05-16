class AddPlanToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :plan_id, :integer #Add new plan_id column with type integer to each entry of users row
    #Will have 0 or 1 to correspond to the plans
  end
end
