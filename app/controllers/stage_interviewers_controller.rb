class StageInterviewersController < ApplicationController

  def new
    @stage_interviewer = StageInterviewer.new
    @stage = Stage.find(params[:stage_id])
  end

  def create
    @stage_interviewer = StageInterviewer.new(interviewer_params)
    @stage = Stage.find(params[:stage_id])
    @stage_interviewer.stage = @stage
    @role = @stage.role
    if @stage_interviewer.save
      redirect_to role_path(@role), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def interviewer_params
    params.require(:stage_interviewer).permit(:user_id)
  end

end
