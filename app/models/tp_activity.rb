class TpActivity < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :city
  belongs_to :user
  #has_one :gallery
  has_many :bookings
  # acts_as_votable
  attr_accessible :id, :title
  attr_accessible :description, :price, :slug, :is_featured, :is_created, :tags
  attr_accessible :image1, :image2, :image3, :image4, :city_id, :user_id, :is_approved

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader

  def uurl
    "/tp_activities/"+ self.slug;
    #    DBModule.
  end

end
