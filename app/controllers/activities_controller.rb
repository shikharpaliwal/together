class ActivitiesController < ApplicationController

  def search
    cards = Activity.search(@user, params)
    render json: { "activities" => cards }, status: 200
  end

  def create
    Activity.create_activity(@user, params)
    render nothing: true, status: 200
  end

  def trending
    cards = Activity.search(@user, params)
    render json: { "activities" => cards }, status: 200
  end

  def random
    cards = Activity.search(@user, params)
    render json: { "activities" => cards }, status: 200
  end

  def participate
    Activity.participate(@user, params)
    render nothing: true, status: 200
  end

  def leave
    Activity.leave(@user, params)
    render nothing: true, status: 200
  end

end
