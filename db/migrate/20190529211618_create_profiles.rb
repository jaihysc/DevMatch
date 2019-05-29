class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id #Key from users table
      t.string :first_name
      t.string :last_name
      t.string :display_name
      t.string :job_title
      t.string :phone_num
      t.string :phone_num
      t.string :contact_email
      t.string :description
      t.timestamps
    end
  end
end
