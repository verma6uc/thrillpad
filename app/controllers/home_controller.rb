class HomeController < ApplicationController
  def index
    @fplaces = Place.find_all_by_is_featured(true);
    @factivities = TpActivity.find_all_by_is_featured(true);
  end

  def home
    @fplaces = Place.find_all_by_is_featured(true);
    @factivities = TpActivity.find_all_by_is_featured(true);
  end

  def repos
    # @locs = Locations.find_all_by_is_created_and_type_of_location(true,"city");
    @locs = Locations.find_all_by_is_created(true);
    @par = Array.new();
    @locs.each { |loc|
      if (loc.parent != -1)
        @par.push(Locations.find(loc.parent));
      else
        @par.push(Locations.find(loc.id));
      end
    }
  end
end
