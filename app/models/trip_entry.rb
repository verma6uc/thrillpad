class TripEntry < ActiveRecord::Base

  #has_many :trip_entry
  belongs_to :trip

  #has_many :trip_hotels

  attr_accessible :entity_id, :trip , :start_date_time,  :end_date_time, :entity_type

end
