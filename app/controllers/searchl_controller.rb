class SearchlController < ApplicationController
  def searchplace
    if !(params[:place].nil?)
      plc = params[:place];
    else
      plc = params[:id];
    end

    #.where("name like ?", "%#{params[:query]}%").to_sql
    @states = State.where("title LIKE '%#{plc}%' and is_created=1 ");
    @cities = City.where("title LIKE '%#{plc}%' and is_created=1 ");
    @acts = Activity.where("title LIKE '%#{plc}%'")
    #@hotels = Hotel.where("title LIKE '%#{plc}%'")
    @places = Place.where("title LIKE '%#{plc}%' and is_created=1 ");
    @search_term = plc;
  end
end
