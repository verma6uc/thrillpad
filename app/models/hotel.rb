class Hotel < ActiveRecord::Base


  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :city
  has_many :hotel_room
  has_one :hotel_facility
  belongs_to :user

  # accepts_nested_attributes_for :hotel_facility

  #accepts_nested_attributes_for :hotel_facility
  #attr_accessible :hotel_facility, :hotel_facility_attributes
  #alias_method :hotel_facility, :hotel_facility_attributes

  attr_accessible :slug, :address, :check_out, :city_id, :description, :hotel_facility
  attr_accessible :hotel_policies, :id, :image1, :image2, :image3, :image4, :map, :number_of_rooms, :title

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader

  attr_accessible :address, :check_out, :city_id, :description, :hotel_policies, :id, :image1, :image2, :image3, :image4, :map, :number_of_rooms, :slug, :title
  #acts_as_votable
  def price
    priceee = id;

    priceee;
  end


  def uurl
    "/hotels/"+ self.slug;
    #    DBModule.
  end


end
