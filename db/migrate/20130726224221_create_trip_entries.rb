class CreateTripEntries < ActiveRecord::Migration
  def change
    create_table :trip_entries do |t|
      t.integer :entity_id
      t.belongs_to :trip
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.string  :entity_type
      t.timestamps
    end
  end
end
