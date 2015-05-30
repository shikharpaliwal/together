class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_user

  def find_user
    if params[:session_token].present?
      @user = User.find_by_session_token(params[:session_token])
    end
  end

end
