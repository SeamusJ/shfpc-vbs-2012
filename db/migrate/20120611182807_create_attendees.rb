class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender
      t.string :parent_first_name
      t.string :parent_last_name
      t.string :parent_email
      t.string :parent_phone
      t.string :parent_email
      t.string :parent_address_1
      t.string :parent_address_2
      t.string :parent_city
      t.string :parent_zip

      t.timestamps
    end
  end
end
