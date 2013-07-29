class HotelFacility < ActiveRecord::Base
  belongs_to :hotel

  attr_accessible :hr_room_service, :airport_transfer, :hotel_id, :id
end
