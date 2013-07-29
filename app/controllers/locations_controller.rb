class LocationsController < ApplicationController

  def city_list
    #plc = params[:id];
    @locs = City.All;
    render "/locations/city_list.json"
  end

  def count_collection
    @country = Country.find(1);
    @cstates = State.find_all_by_country_id_and_is_created(1, true);
    render "/locations/state_collection"
  end

  def state_collection
    @state = State.find(params[:id]);
    render "/locations/city_collection"
  end

  def city_collection
    @city = City.find(params[:id]);
    render "/locations/place_collection"
  end

  def home
    @places = Place.find_all_by_is_featured(true);
    #@places.each do |place|
    #  place.is_featured = false;
    #  place.save;
    # end

  end

  def jssearch
    plc = params[:id];
    @locs = Array.new;
    #array3 = array1 + array2
    @locs_c = City.where("title LIKE '#{plc}%' and is_created=1 ");
    @locs_p = Place.where("title LIKE '#{plc}%' and is_created=1 ");


    render "/locations/jssearch.json"

  end

  def collection
    @location = Locations.find(params[:id]);
    if (@location.parent != -1)
      @state = Locations.find(@location.parent);
    end
    if (@location.parent != -1)
      @country = Locations.find(@state.parent);
    end
    #Locations.find_all_by_is_created_and_id(true,@location.parent);
    @places = Locations.find_all_by_is_created_and_parent(true, @location.id);
  end

  def country
    @location = Country.find(params[:cid]);
    @fstates = State.find_all_by_is_created_and_is_featured_and_country_id(true, true, @location.id);
  end

  def state
    @location = State.find(params[:sid]);
    @fcities = City.find_all_by_is_created_and_is_featured_and_state_id(true, true, @location.id);
  end

  def city
    @state = State.find(params[:sid]);
    @location = City.find(params[:ctid]);
    @acts = TpActivity.find_all_by_city_id(@location.id);
    @fplaces = Place.find_all_by_is_created_and_is_featured_and_city_id(true, true, @location.id);


  end

  def place
    @location = Place.find(params[:pid]);
    #@location.liked_by current_user;
  end

  def upvote_places
    @place = Place.find(params[:pid]);
    #@location = Place.find(params[:pid]);
    @place.liked_by current_user
    @location = Place.find(params[:pid]);
    render "/locations/place"
  end

  def upvote_cities
    @place = City.find(params[:ctid]);
    #@location = Place.find(params[:pid]);
    @place.liked_by current_user
    @location = City.find(params[:ctid]);
    @state = State.find(params[:sid]);
    @location = City.find(params[:ctid]);
    @acts = Activity.find_all_by_city_id(@location.id);
    @fplaces = Place.find_all_by_is_created_and_is_featured_and_city_id(true, true, @location.id);
    render "/locations/city"
  end

  def upvote_states
    @location = State.find(params[:sid]);
    @fcities = City.find_all_by_is_created_and_is_featured_and_state_id(true, true, @location.id);
    @place = State.find(params[:sid]);
    #@location = Place.find(params[:pid]);
    @place.liked_by current_user
    @location = State.find(params[:sid]);
    render "/locations/state"
  end


  def loc
#@cities = City.where("title LIKE '%#{plc}%' and is_created=1 ");
    plc = params[:id]
    @locations = City.where("title LIKE '#{plc}%' and is_created=1 "); #City.find_all_by_title(params[:id]);
    render '/locations/loc.xhr', :layout => false
  end

end

