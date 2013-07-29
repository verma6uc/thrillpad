class Place < ActiveRecord::Base


  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :city
  # has_many :places
  #
  #has_one :gallery
  #acts_as_votable
  attr_accessible :city_id, :id, :title
  attr_accessible :map, :description, :history, :slug, :is_featured, :is_created, :gallery_id
  attr_accessible :image1, :image2, :image3, :image4, :uurl
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader

  def uurl
    "/locations/"+ self.city.state.country.slug + "/" + self.city.state.slug+  "/"+ self.city.slug+"/"+ self.slug;
    #"AAAA"
  end

  def parent
    city;
  end


  def breadcrumbs
    '<ul class="breadcrumb"></i>
  <li><a href="/">Home</a> <span class="divider">/</span></li>
<li><a href="/locations">Destinations</a> <span class="divider">/</span></li>
  <li><a href="'+city.state.country.uurl+'">'+city.state.country.title+'</a> <span class="divider">/</span></li>
<li><a href="'+city.state.uurl+'">'+city.state.title+'</a> <span class="divider">/</span></li>

<li><a href="'+city.uurl+'">'+city.title+'</a> <span class="divider">/</span></li>
  <li class="active"> <a href="#">'+title+'</a> </li>
</ul>'
  end


end
