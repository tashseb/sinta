class InterviewsController < ApplicationController
  skip_before_action :authenticate_user!
  # before_action :set_interview, only: %i[new create ]

  def index
    @interviews = Interview.all
  end

  def show
    @interview = Interview.find(params[:id])
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    @role = @interview.stage.role
    if @interview.save
      redirect_to role_path(@role), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end


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
