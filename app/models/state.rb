class State < ActiveRecord::Base


  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :cities
  belongs_to :country


  #acts_as_votable
  attr_accessible :id, :country_id, :scode, :title
  attr_accessible :map, :description, :history, :slug, :is_featured, :is_created, :gallery_id
  attr_accessible :image1, :image2, :image3, :image4, :uurl

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader

  def uurl
    "/locations/"+ self.country.slug + "/" + self.slug;
  end

  def parent
    country;
  end

  def tp_activities
    # find the list of activties
    act = Array.new;
    for city in cities
      act = act + city.tp_activities;

    end
    act;
  end

  def hotels
    # find the list of activties
    hotels = Array.new;
    for city in cities
      hotels = hotels + city.hotels;

    end
    hotels;
  end


  def breadcrumbs
    '<ul class="breadcrumb"></i>
  <li><a href="/">Home</a> <span class="divider">/</span></li>
<li><a href="/locations">Destinations</a> <span class="divider">/</span></li>
  <li><a href="'+country.uurl+'">India</a> <span class="divider">/</span></li>
  <li class="active"> <a href="#" >'+title+'</a></li>
</ul>'
  end

end
