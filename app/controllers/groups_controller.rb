class GroupsController < ApplicationController
  before_action :authenticate_user!
  def show
    @groups = Groups.find(params[:id])
    authorize! :read, @groups
  end

  def index
    @groups = current_user.groups
  end

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def authenticate_user!
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
