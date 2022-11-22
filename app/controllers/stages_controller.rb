class StagesController < ApplicationController
  def index
    @stages = Stage.all
  end

  def create
    @stage = Stage.new(stage_params)
    @role = Role.find(params[:role_id])
    @stage.role = @role
    if @stage.save
      redirect to role_path(@role), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  # end

  # def update
  #   @stage = Stage.find(params[:id])
  #   if @stage.update(stage_params)
  #     redirect_to , status: :see_other
  #   else
  #     , status: :unprocessable_entity
  #   end
  # end

  private

  def stage_params
    params.require(:stage).permit(:name, :role_id)
  end
end
