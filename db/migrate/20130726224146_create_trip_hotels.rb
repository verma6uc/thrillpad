class CreateTripHotels < ActiveRecord::Migration
  def change
    create_table :trip_hotels do |t|
      t.belongs_to :hotel
      t.belongs_to :hotel_room
      t.date :start_date
      t.date :end_date
      t.belongs_to :trip
      t.timestamps
    end
  end
end
