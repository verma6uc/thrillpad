class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.primary_key :id
      t.string :tp_activity_id
      t.string :user_id
      t.string :start_time
      t.integer :number_of_people
      t.string :date
      t.string :amount_status
      t.string :is_confirmed
      t.belongs_to :user
      t.belongs_to :tp_activity
      t.timestamps
    end
  end
end
