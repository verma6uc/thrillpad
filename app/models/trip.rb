class Trip < ActiveRecord::Base
  attr_accessible :user, :user_id

  has_many :trip_entries
  belongs_to :user
  has_many :trip_hotels

  def title
    if (trip_entries[0].entity_type == "TpActivity")
      #<%= @user.name %>'s Trip to <%= trip.trip_entries[0]. %>
      user.name + "'s Trip to "+ TpActivity.find(trip_entries[0].entity_id).city.title
    else
      if (trip_entries[0].entity_type == "Place")
        user.name + "'s Trip to "+ Place.find(trip_entries[0].entity_id).city.title
      end
    end
  end

  def thumbnail
    if (trip_entries[0].entity_type == "TpActivity")

      TpActivity.find(trip_entries[0].entity_id).image1.thumb.url
    else
      if (trip_entries[0].entity_type == "Place")
        Place.find(trip_entries[0].entity_id).image1.thumb.url
      end
    end
  end

  def img
    if (trip_entries[0].entity_type == "TpActivity")

      TpActivity.find(trip_entries[0].entity_id).image1.url
    else
      if (trip_entries[0].entity_type == "Place")
        Place.find(trip_entries[0].entity_id).image1.url
      end
    end
  end
end
