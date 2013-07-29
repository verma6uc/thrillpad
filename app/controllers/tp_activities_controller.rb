class TpActivitiesController < ApplicationController
  def country
    @location = Country.find(params[:cid]);
    @tagline = "<h3 class='section-header'>  tactivities in
    <a  title data-original-title='"+@location.description.html_safe+"' data-toggle='tooltip' data-placement='bottom' href='/locations/"+@location.slug+"' >"+@location.title+"</a></h3> "
    @activities = TpActivity.all(); # Country.find(params[:cid]);
    @tag_list_main = Hash.new;
    @tag_list = Array.new;
    @activities.each do |act|
      tagz = " ";
      act.tags.gsub(" ", "").split(",").each do |tag|
        tagz = tagz + " " + tag;
        @tag_list_main[tag] = tag;
      end
      logger.debug "----tagz----------" + tagz;
      @tag_list.push(tagz);
    end
    render 'tp_activities/coll';
  end

  def state
    @location = State.find(params[:sid]);
    @tagline = "<h3 class='section-header'>  tactivities in
    <a href='/locations/"+@location.country.slug+"/" +@location.slug+"' >"+@location.title+"</a></h3> "

    @activities = TpActivity.all();
    cities = City.find_all_by_state_id(State.find(params[:sid]));

    @activities = Array.new;
    cities.each_index do |i|
      @activities = @activities + TpActivity.find_all_by_city_id(cities[i].id);
    end

    @tag_list_main = Hash.new;
    @tag_list = Array.new;
    @activities.each do |act|
      tagz = "";
      act.tags.split(",").each do |tagggg|
        @tag_list_main[tagggg] = tagggg;
        tagz = tagz +" " + tagggg;
      end
      @tag_list.push(tagz);
    end
    render 'tp_activities/coll';
  end

  def city
    @location = City.find(params[:ctid]);
    @tagline = "<h3 class='section-header'>  tactivities in
    <a href='/locations/"+@location.state.country.slug+"/"+@location.state.slug+"/"+@location.slug+"' >"+@location.title+"</a></h3> "
    @activities = TpActivity.find_all_by_city_id(City.find(params[:ctid]).id);
    @tag_list_main = Hash.new;
    @tag_list = Array.new;
    @activities.each do |act|
      tagz = Array.new;
      act.tags.split(",").each_index do |j|
        @tag_list_main[act.tags[j]] = act.tags[j];
        tagz.push(act.tags[j]);
      end
      @tag_list.push(tagz);
    end

    render 'tp_activities/coll';
  end

  def place
    @location = Place.find(params[:pid]);
  end


  def home
    @places = TpActivity.find_all_by_is_featured(true);

  end

  def jssearch
    plc = params[:id];
    @locs = TpActivity.where("title LIKE '#{plc}%' and is_approved=1 AND is_featured=1 "); #Location.where("title like ?", "%#{params[:query]}%").to_sql.
    render "/tp_activities/jssearch.json"
  end

  def upvote_places
    @place = Place.find(params[:pid]);
    #@location = Place.find(params[:pid]);
    @place.liked_by current_user
    @location = Place.find(params[:pid]);
    render "/locations/place"
  end


  # GET /tp_activities/1
  # GET /tp_activities/1.json
  def show

    @activity = TpActivity.find(params[:id])
    @location = City.find(@activity.city_id);
    @state = @location.state;
    @acts = TpActivity.find_all_by_city_id_and_is_approved(@activity.city_id, true);
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end

  end


  def tags
    plc = params[:id];
    @activities = TpActivity.where("tags LIKE '%#{plc}%'")
    @tag_list_main = Hash.new;
    @tag_list = Array.new;
    @activities.each do |act|
      tagz = " ";
      act.tags.gsub(" ", "").split(",").each do |tag|
        tagz = tagz + " " + tag;
        @tag_list_main[tag] = tag;
      end
      logger.debug "----tagz----------" + tagz;
      @tag_list.push(tagz);
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activities }
    end
  end

  # GET /tp_activities/new
  # GET /tp_activities/new.json
  def new
    @TpActivity = TpActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @TpActivity }
    end
  end

  # GET /tp_activities/1/edit
  def edit
    @TpActivity = TpActivity.find(params[:id])
  end

  # POST /tactivities
  # POST /tactivities.json
  def create
    @TpActivity = TpActivity.new(params[:TpActivity])
    @TpActivity.save();
    @TpActivity.user = current_user;
    @TpActivity.city = City.find_all_by_title(params[:TpActivity_parent])[0];
    taglist=""; #cat_list[i]
    logger.debug "----------- params[:TpActivity_tags] " + params[:TpActivity_tags].to_s();
    #cat_list =  params[:TpActivity_tags];
    if (params[:TpActivity_tags].size != 0)
      params[:TpActivity_tags].each_index do |i|
        logger.debug "----------- categry name " + params[:TpActivity_tags][i]

        if  !(params[:TpActivity_tags][i] == '')
          taglist= taglist+","+ params[:TpActivity_tags][i];
        end
      end
    end
    @TpActivity.tags = taglist;
    @TpActivity.save
    respond_to do |format|
      if @TpActivity.save
        format.html { redirect_to @TpActivity, notice: 'TpActivity was successfully created.' }
        format.json { render json: @TpActivity, status: :created, location: @TpActivity }
      else
        format.html { render action: "new" }
        format.json { render json: @TpActivity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tp_activities/1
  # PUT /tp_activities/1.json
  def update
    @TpActivity = TpActivity.find(params[:id])

    respond_to do |format|
      if @TpActivity.update_attributes(params[:TpActivity])
        format.html { redirect_to @TpActivity, notice: 'TpActivity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @TpActivity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tp_activities/1
  # DELETE /tp_activities/1.json
  def destroy
    @TpActivity = TpActivity.find(params[:id])
    @TpActivity.destroy

    respond_to do |format|
      format.html { redirect_to tactivities_url }
      format.json { head :no_content }
    end
  end
end
