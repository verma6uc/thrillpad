class TripController < ApplicationController

  def show
    @trip = Trip.find(params[:id]);

    @entrymodels = Array.new;
    @trip.trip_entries.each_with_index do |entry, index|
      if (entry.entity_type == "TpActivity")
        logger.debug("entry type " +entry.entity_type + " :: id ->"+ entry.id.to_s);
        @entrymodels.push(TpActivity.find(entry.entity_id))
      else
        @entrymodels.push(Place.find(entry.entity_id))
      end
    end
  end

  def slideshow
    @trip = Trip.find(params[:id]);

    @entrymodels = Array.new;
    @trip.trip_entries.each_with_index do |entry, index|
      if (entry.entity_type == "TpActivity")
        logger.debug("entry type " +entry.entity_type + " :: id ->"+ entry.id.to_s);
        @entrymodels.push(TpActivity.find(entry.entity_id))
      else
        @entrymodels.push(Place.find(entry.entity_id))
      end
    end

    render "trip/slideshow.json"
  end

  def new
    #<input type="text" class="span3" style="margin: 0 auto;" data-provide="typeahead" data-items="4"
    #data-source="[&quot;Alabama&quot;,&quot;Alaska&quot;,&quot;Arizona&quot;,&quot;Arkansas&quot;,&quot;California&quot;,&quot;Colorado&quot;,&quot;Connecticut&quot;,&quot;Delaware&quot;,&quot;Florida&quot;,&quot;Georgia&quot;,&quot;Hawaii&quot;,&quot;Idaho&quot;,&quot;Illinois&quot;,&quot;Indiana&quot;,&quot;Iowa&quot;,&quot;Kansas&quot;,&quot;Kentucky&quot;,&quot;Louisiana&quot;,&quot;Maine&quot;,&quot;Maryland&quot;,&quot;Massachusetts&quot;,&quot;Michigan&quot;,&quot;Minnesota&quot;,&quot;Mississippi&quot;,&quot;Missouri&quot;,&quot;Montana&quot;,&quot;Nebraska&quot;,&quot;Nevada&quot;,&quot;New Hampshire&quot;,&quot;New Jersey&quot;,&quot;New Mexico&quot;,&quot;New York&quot;,&quot;North Dakota&quot;,&quot;North Carolina&quot;,&quot;Ohio&quot;,&quot;Oklahoma&quot;,&quot;Oregon&quot;,&quot;Pennsylvania&quot;,&quot;Rhode Island&quot;,&quot;South Carolina&quot;,&quot;South Dakota&quot;,&quot;Tennessee&quot;,&quot;Texas&quot;,&quot;Utah&quot;,&quot;Vermont&quot;,&quot;Virginia&quot;,&quot;Washington&quot;,&quot;West Virginia&quot;,&quot;Wisconsin&quot;,&quot;Wyoming&quot;]">
    @city_str = '[';
    City.all().each_with_index do |place, index|
      if (index ==0)
        @city_str = @city_str +' "'+place.title + '" ';
      else
        @city_str = @city_str +', "'+place.title + '" ';
      end
    end
    @city_str = @city_str+ ']'
    #'["Jaipur", "Agra", "Jhansi", "Allahabad", "Jaisalmer", "Varanasi", "Jodhpur", "Lucknow", "Udaipur", "Chittorgarh", "Ajmer", "Bundi", "Bikaner", "Delhi", "Bangalore", "Mumbai", "Ahmedabad", "Rajkot", "Kutch", "Junagadh", "Vadodara", "Surat", "Jamnagar", "Alappuzha", "Ernakulam", "Idukki", "Kannur", "Kasaragod", "Rishikesh ", "Kollam", "Kottayam", "Kozhikode", "Malappuram", "Palakkad ", "Pathanamthitta", "Thiruvananthapuram", "Thrissur ", "Wayanad", "Almora", "Dehradun", "Nainital", "Haridwar", "Kausani", "Mussoorie ", "Ranikhet", "Kolkata", "Darjeeling", "Bagdogra", "Kalimpong", "Dibrugarh ", "Guwahati", "chennai", "Goa", "Kochi"]';
    @locations = City.all();
  end

  def create

    str_sch = params[:drag_list];
    str_sch = str_sch.gsub("aaaaa", "").gsub("',  '", ",").gsub("'", "")
    Rails.logger.debug "+++++++++++++"+params.inspect

    items = Hash.new;


    str_sch.split(",").each_with_index do |place, index|
      if !(place.split("#")[1].nil?)
        if (place.split("#")[1].include? "place")
          items[place.split("#")[0]] = Place.find(place.split("#")[1].gsub("place_", "").to_i)
          logger.debug("position -->");
        else
          if ((place.split("#")[1].include? "act"))
            items[place.split("#")[0]] = TpActivity.find(place.split("#")[1].gsub("act_", "").to_i)
          end
        end
      end
    end


    Rails.logger.debug "+++++++++++++"+items.to_s()

    trip = Trip.new;
    trip.user_id = current_user.id;
    trip.save();

    items.each do |key, val|
      #  attr_accessible :entity_id, :trip , :start_date_time,  :end_date_time, :entity_type

      trip_entry = TripEntry.new;
      trip_entry.trip = trip;
      trip_entry.entity_id = val.id;
      trip_entry.entity_type= val.class.name.to_s;
      trip_entry.start_date_time = key
      trip_entry.end_date_time = (trip_entry.start_date_time.to_time + 2.hours).to_datetime # key +
      trip_entry.save()
    end

    if !(session[:room_id].nil?)
    tripHotel = TripHotel.new;
    tripHotel.hotel_id = HotelRoom.find(session[:room_id]).hotel.id;
    tripHotel.hotel_room_id = HotelRoom.find(session[:room_id]).id;
    tripHotel.start_date = session[:start_date];
    tripHotel.end_date = session[:end_date]
    tripHotel.trip_id = trip.id;
    tripHotel.save
         end

  end

  #/trip/step2/<%= place.title %>

  def step2
    @location = City.find_by_title(params[:id]);
  end

  def step3
    Rails.logger.debug "+++++++++++++"+params.inspect
    @location = City.find(params[:city_id]);
    #Parameters: {"city_id"=>"1", "start_date"=>"2013-07-26", "end_date"=>"2013-07-31", "room_type"=>"2", "140"=>"Reserve"}
    session[:start_date]=params[:start_date];
    session[:end_date]=params[:end_date];
    session[:room_id]=params[:room_type];

  end

  def step4
    Rails.logger.debug "+++++++++++++"+params.inspect
    #{"city_id"=>"1", "place_id"=>["1", "9", "10"], "controller"=>"trip", "action"=>"step4"}
    @location = City.find(params[:city_id]);
    session[:places]=params[:place_id];


  end

  def step5
    Rails.logger.debug "+++++++++++++"+params.inspect
    #{"city_id"=>"1", "place_id"=>["1", "9", "10"], "controller"=>"trip", "action"=>"step4"}
    @location = City.find(params[:city_id]);
    session[:acts]=params[:act_id];
    @no_of_days = (Date.strptime(session[:end_date]) -Date.strptime(session[:end_date])).to_s;

    @places = Array.new;
    @acts = Array.new;
    session[:places].each_with_index do |place_id, index|
      @places.push(Place.find(place_id));
    end

    if !(session[:acts].nil?)
      session[:acts].each_with_index do |act_id, index|
        @acts.push(TpActivity.find(act_id));
      end
    end

    @sch_blank = Array.new();
    Date.strptime(session[:start_date]).upto(Date.strptime(session[:end_date])) do |day|
      logger.debug("------- 2013-07-29 -----YYYY-MM-DD HH:MM:SS -----"+day.to_s());
      @sch_blank.push(day.to_s()+ " 10:00:00"); #DateTime.new(2001,2,3)
      @sch_blank.push(day.to_s()+ " 14:00:00"); #DateTime.new(2001,2,3)
      @sch_blank.push(day.to_s()+ " 16:00:00"); #DateTime.new(2001,2,3)
      @sch_blank.push(day.to_s()+ " 18:00:00"); #DateTime.new(2001,2,3)
    end
  end
end

