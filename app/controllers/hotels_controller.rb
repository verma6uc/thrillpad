class HotelsController < ApplicationController

  def edit
    @hotel = Hotel.find(params[:id]);
    @hotelfac = @hotel.hotel_facility;
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    @hotel = Hotel.new(params[:hotel])

    respond_to do |format|
      if @hotel.update_attributes(params[:Activity])
        format.html { redirect_to @hotel, notice: '@hotel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /activities
  # POST /activities.json
  def create
    @hotel = Hotel.new(params[:hotel]) #hotel[hotel_facility][hr_room_service]
    @hotel.user = current_user;
    @hotel.city = City.find_all_by_title(params[:hotel_parent])[0];
    @hotel.save();

    @hotel_facility = HotelFacility.new
    @hotel_facility.hotel_id = @hotel.id;
    @hotel_facility.save();
    Rails.logger.debug params.inspect #/hotels/10/edit/
    redirect_to "/hotel_facilities/"+@hotel_facility.id.to_s()+"/edit/"
  end

  def new
    @hotel = Hotel.new
    #@hotelfac = HotelFacility.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hotel }
    end
  end


  def show

    @hotel = Hotel.find(params[:id]);
    @location = City.find(@hotel.city_id);
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @Activity }
    end
  end

  #match "/hotel/:cid/:sid/:ctid" => "hotels#city"

  def city
    @location = City.find(params[:ctid]);
    @tagline = "<h3 class='section-header'>  Hotels in
    <a href='/locations/"+@location.state.country.slug+"/"+@location.state.slug+"/"+@location.slug+"' >"+@location.title+"</a></h3> "
    render 'hotels/coll';
  end

  def state
    @location = State.find(params[:sid]);
    @tagline = "<h3 class='section-header'>  Hotels in
    <a href='/locations/"+@location.country.slug+"/" +@location.slug+"' >"+@location.title+"</a></h3> "
    render 'hotels/coll';
  end

end