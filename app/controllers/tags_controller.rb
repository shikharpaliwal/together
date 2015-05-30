class TagsController < ApplicationController

  def trending
    tags = Tag.get_trending_tags
    render json: { "tags" => tags }, status: 200
  end

  def autocomplete
    tags = Tag.autocomplete(params)
    render json: { "tags" => tags }, status: 200
  end

end
