class StagesController < ApplicationController
  # def create
  #   @stage = Stage.new(stage_params)
  #   if @stage.save
  #   else
  #   end
  # end

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
