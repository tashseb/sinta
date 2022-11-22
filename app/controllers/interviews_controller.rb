class InterviewsController < ApplicationController
  def index
    @interviews = Interview.all
  end

  # def show
  #   @interview = Interview.find(params[:id])
  # end

  # def update
  #   @interview = Interview.find(params[:id])
  #   if @interview.update(interview_params)
  #     redirect_to , status: :see_other
  #   else
  #     , status: :unprocessable_entity
  #   end
  # end

  private

  def interview_params
    params.require(:interview).permit(:user_id, :candidate_id, :stage_id, :feedback, :rating)
  end
end
