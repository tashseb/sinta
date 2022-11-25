class RolesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @roles = Role.all
    @users = User.all
  end

  def new
    @role = Role.new
    @interview = Interview.find(params[:interview_id])
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      redirect_to role_path(@role, tab: "stages")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @role = Role.find(params[:id])
    @users = User.all
    @stage = Stage.new
    @candidates = Candidate.all
    @stages_questions = Stage.where(role: @role)
    @question = Question.new
    @candidate = Candidate.new
    @interview = Interview.all
  end

  private

  def role_params
    params.require(:role).permit(:title, :description, :completed, :user_id)
  end
end
