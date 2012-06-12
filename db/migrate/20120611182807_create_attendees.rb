class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :child_name
      t.string :address
      t.integer :age
      t.string :birth_date
      t.string :grade

      t.string :parent_first_name
      t.string :parent_last_name
      t.string :parent_email
      t.string :parent_phone_home
      t.string :parent_phone_cell
      t.string :parent_phone_work
      t.string :willing_to_assist

      t.string :emergency_contact_name1
      t.string :emergency_contact_name2
      t.string :emergency_contact_phone1
      t.string :emergency_contact_phone2

      t.string :pickup_name1
      t.string :pickup_relationship1
      t.string :pickup_name2
      t.string :pickup_relationship2
      t.string :pickup_name3
      t.string :pickup_relationship3

      t.text :other

      t.timestamps
    end
  end
end
