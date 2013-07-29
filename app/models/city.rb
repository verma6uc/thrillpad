class City < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :state
  has_many :places
  has_many :tp_activities
  #has_one :gallery
  has_many :hotels
  #acts_as_votable

  attr_accessible :id, :pin_end, :pin_start, :state_id, :title
  attr_accessible :map, :description, :history, :slug, :is_featured, :is_created, :gallery_id, :uurl
  attr_accessible :image1, :image2, :image3, :image4, :uurl
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader

  def uurl
    "/locations/"+ self.state.country.slug + "/" + self.state.slug+ "/"+ self.slug;
    #    DBModule.
  end

  def parent
    state;
  end

  def breadcrumbs
    '<ul class="breadcrumb"></i>
  <li><a href="/">Home</a> <span class="divider">/</span></li>
<li><a href="/locations">Destinations</a> <span class="divider">/</span></li>
  <li><a href="'+state.country.uurl+'">India</a> <span class="divider">/</span></li>
<li><a href="'+state.uurl+'">'+state.title+'</a> <span class="divider">/</span></li>
  <li class="active"><a href="#">'+title+'</a></li>
</ul>'
  end

end
