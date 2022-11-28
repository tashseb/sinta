class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(:id)
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @user.role = @role
    if @user.save
      redirect_to role_path(@role)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :position, :department)
  end

end
