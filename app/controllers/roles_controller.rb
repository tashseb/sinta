class RolesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      redirect_to role_path(@role), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @role = Role.find(params[:id])
    @stage = Stage.new
  end

  private

  def role_params
    params.require(:role).permit(:title, :description, :completed)
  end
end
