class CreateContactsNew < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts_new do |t|
      t.string :name
      t.string :email
      t.text :comments
      t.timestamps
    end
  end
end
