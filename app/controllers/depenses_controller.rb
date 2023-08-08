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
      puts 'Depense saved successfully!'
      redirect_to group_path(@group), notice: 'Expense was successfully added.'
    else
      puts 'Error saving depense:', @depense.errors.full_messages.join(', ')
      redirect_to group_path(@group)
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def depense_params
    params.permit(:name, :amount)
  end
end
