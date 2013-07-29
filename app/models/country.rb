class Country < ActiveRecord::Base


  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :states
  # has_many :states
  #has_many :cities, :through => :states
  #has_many :places, :through => :cities
  #has_one :gallery

  #acts_as_votable


  attr_accessible :ccode, :currency, :currency_code, :id, :title
  attr_accessible :map, :description, :history, :slug, :is_featured, :is_created, :gallery_id
  attr_accessible :image1, :image2, :image3, :image4, :uurl
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader

  def uurl
    "/locations/"+ self.slug
  end

  def parent
    self;
  end

  def breadcrumbs
    '<ul class="breadcrumb"><i class="icon-pencil"></i>
  <li><a href="/">Home</a> <span class="divider">/</span></li>
<li><a href="/locations">Destinations</a> <span class="divider">/</span></li>
  
  <li class="active"> <a href="#">'+title+'</a></li>
</ul>'
  end
end
