class HotelRoom < ActiveRecord::Base
  attr_accessible :description, :hotel_id, :id, :image1, :image2, :price, :title
  belongs_to :hotel
end
