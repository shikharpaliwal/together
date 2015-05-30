class UsersController < ApplicationController

  def login
    user = User.modified_find_or_create(params)
    render json: { "session_token" => user.session_token }, status: 200
  end

  def friends
    User.add_friends(@user, params)
    render nothing: true, status: 200
  end

end
