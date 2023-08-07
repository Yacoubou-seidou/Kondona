class DepensesController < ApplicationController
  before_action :authenticate_user!
  def show
    @depenses = Depenses.find(params[:id])
    authorize! :read, @depenses
  end

  def index
    @depenses = current_user.depenses
  end

  def new
    @depense = current_user.depenses.build
  end

  def create
    @depense = current_user.depenses.build(depense_params)
    if @depense.save
      redirect_to depenses_path
    else
      render :new
    end
  end

  def authenticate_user!
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  private

  def depense_params
    params.require(:depense).permit(:name, :amount)
  end
end
