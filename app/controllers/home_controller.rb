class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    return unless user_signed_in?

    @user_groups = current_user.groups # Retrieve the current user's groups
    render 'new'
  end
end
