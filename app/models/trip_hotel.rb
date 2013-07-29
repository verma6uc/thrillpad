class TripHotel < ActiveRecord::Base

  belongs_to :trip


  attr_accessible :hotel, :hotel_room, :start_date, :end_date, :trip, :trip_id, :hotel_id, :hotel_room_id
end
