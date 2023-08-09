class GroupsController < ApplicationController
  before_action :authenticate_user!

  def show
    @group = Group.find(params[:id])
    @depenses = @group.depenses.order(created_at: :desc)
  end

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def authenticate_user!
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
