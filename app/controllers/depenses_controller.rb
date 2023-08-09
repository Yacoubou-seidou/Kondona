class DepensesController < ApplicationController
  before_action :set_group, :authenticate_user!

  def new
    @depenses = @group.depenses
    @depense = Depense.new
  end

  def create
    @depense = Depense.new(depense_params)
    @depense.user = current_user
    @group_depense = GroupDepense.new(group: @group, depense: @depense)
    if @group_depense.save
      redirect_to group_path(@group), notice: 'Depense was successfully added.'
    else
      render :new
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def depense_params
    params.require(:depense).permit(:name, :amount)
  end
end
