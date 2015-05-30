class UsersController < ApplicationController

  def login
    user = User.find_or_create(params)
    render json: { "session_token" => user["data"]["session_token"] }, status: 200
  end

  def friends
    User.add_friends(@user_node, params)
    render nothing: true, status: 200
  end

end
