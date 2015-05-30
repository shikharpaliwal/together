Together::Application.routes.draw do

  post "/user/login" => 'users#login'
  post "/user/friends" => 'users#friends'
  get "/tag/trending" => 'tags#trending'
  get "/tag/autocomplete" => 'tags#autocomplete'
  get "/activity/search" => 'activities#search'
  post "/activity/create" => 'activities#create'
  get "/activity/trending" => 'activities#trending'
  get "/activity/random" => 'activities#random'
  post "/activity/participate" => 'activities#participate'
  post "/activity/leave" => 'activities#leave'
  post "/activity/participating" => 'activities#participating'
  post "/activity/memories" => 'activities#memories'

end
