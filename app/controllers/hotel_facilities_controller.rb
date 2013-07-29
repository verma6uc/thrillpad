class HotelFacilitiesController < ApplicationController

  def update
    @hotel = Hotel.new(params[:hotel])
    Rails.logger.debug "+++++++++++++"+params.inspect;
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


  def new
    @hotel_fac = HotelFacility.new
    #@hotelfac = HotelFacility.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hotel_fac }
    end
  end

  def show
    @hotel = Hotel.find(params[:id]);
  end

  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @Activity }
  end


end
