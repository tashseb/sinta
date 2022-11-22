class RolesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(strong_params)
    if @role.save
      redirect_to role_path(@role)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @role = Role.find(params[:id])
  end


  def strong_params
    params.require(:role).permit(:title, :description)
  end
end
