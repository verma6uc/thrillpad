ThrillPad::Application.routes.draw do
  

  get "trip/new"
  post "trip/create"
  get "trip/step2/:id" => "trip#step2"
  post "trip/step3"
  post "trip/step4"
  post "trip/step5"
  get "trip/slideshow/:id" => "trip#slideshow"
  get "trip/:id" => "trip#show"

  resources :hotels
  get "/hotel/" => "hotels#home"
  get "/hotel/jssearch/:id" => "hotels#jssearch"
  get "/hotel/:cid/:sid/:ctid/:pid" => "hotels#place"
  get "/hotel/:cid/:sid/:ctid" => "hotels#city"
  get "/hotel/:cid/:sid" => "hotels#state"
  get "/hotel/:cid" => "hotels#country"

  post "searchl/searchplace"
  get "searchl/searchplace/:id" => "searchl#searchplace"

  resources :tp_activities
  get "/activity/tags/:id" => "tp_activities#tags"

  get "/activity/" => "tp_activities#home"
  get "/activity/jssearch/:id" => "tp_activities#jssearch"

  get "/activity/:cid/:sid/:ctid/:pid" => "tp_activities#place"
  get "/activity/:cid/:sid/:ctid" => "tp_activities#city"
  get "/activity/:cid/:sid" => "tp_activities#state"
  get "/activity/:cid" => "tp_activities#country"

  # get "/tp_activities/:id" => "tp_activities#show"

  get "pages/about_us"
  get "pages/faq"
  get "pages/terms"
  get "pages/privacy"
  get "pages/contact_us"
  get "pages/how_it_works"

  get "/locations/city_list" =>"locations#city_list"

  get "/locations/pcollection/:id" => "locations#city_collection"
  get "/locations/scollection/:id" => "locations#count_collection"
  get "/locations/ccollection/:id" => "locations#state_collection"

  get "/locations/:cid/:sid/:ctid/:pid" => "locations#place"
  get "/locations/:cid/:sid/:ctid" => "locations#city"
  get "/locations/:cid/:sid" => "locations#state"
  get "/locations/:cid" => "locations#country"

  get "/locations/" => "locations#home"
  get "/locations_js/jssearch/:id" => "locations#jssearch"

  get "/locations_vote/:cid/:sid/:ctid/:pid" => "locations#upvote_places"
  get "/locations_vote/:cid/:sid/:ctid" => "locations#upvote_cities"
  get "/locations_vote/:cid/:sid" => "locations#upvote_states"
  get "/locations_vote/:cid" => "locations#upvote_countries"

  get "/loc/:id" => "locations#loc"
  root :to => "home#home"

  get "/profile/:id" => "users#show"
  get "/users/edit/:id" =>  "users#edit"
  get "/users/trips/:id" => "users#trips"
  devise_for :users
  #resources :users, except: "create"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
