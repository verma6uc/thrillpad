class ApplicationController < ActionController::Base
  before_filter :get_foo
  #after_filter :store_location


  def get_foo
    @foo = "+1-800-730-2305";
    @states_of_india = State.find_all_by_country_id(1);
    # @projects_all = Project.isactive.find(:all, :order => 'LOWER(name) asc')
    @cities_of_india = City.all();
    #ActiveRecord::Base.logger = nil
  end

  #after_filter :store_location
  #def store_location
  #  session[:previous_urls] ||= []
  # store unique urls only
  #  session[:previous_urls].prepend request.fullpath if session[:previous_urls].first != request.fullpath
  # For Rails < 3.2
  # session[:previous_urls].unshift request.fullpath if session[:previous_urls].first != request.fullpath
  #   session[:previous_urls].pop if session[:previous_urls].count > 2
  # end
  # def after_sign_in_path_for(resource)
  #   session[:previous_urls].last || root_path
  # end
end
