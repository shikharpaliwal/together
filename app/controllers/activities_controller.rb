class ActivitiesController < ApplicationController

  def search
    cards = Activity.search(params, @user_node)
    render json: { "activities" => cards }, status: 200
  end

  def create
    Activity.create(params, @user_node)
    render nothing: true, status: 200
  end

  def trending
    cards = Activity.search(params, @user_node)
    render json: { "activities" => cards }, status: 200
  end

  def random
    cards = Activity.search(params, @user_node)
    render json: { "activities" => cards }, status: 200
  end

  def participate
    Activity.participate(params, @user_node)
    render nothing: true, status: 200
  end

  def leave
    Activity.leave(params, @user_node)
    render nothing: true, status: 200
  end

end
