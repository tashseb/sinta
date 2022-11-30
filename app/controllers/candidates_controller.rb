class CandidatesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @role = Role.find(params[:role_id])
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    @role = Role.find(params[:role_id])
    @candidate.stage = @role.stages.order(created_at: :asc).first
    if @candidate.save
      SlackNotifier::CLIENT.ping "🎉 New Candidate Added:🎉 #{@candidate.first_name} #{@candidate.last_name} ~ #{@role.title} Role"
      @interview =Interview.create(stage: @candidate.stage, user: current_user, candidate: @candidate)
      redirect_to role_path(@role)
      # SendQuestions.perform_now(@interview)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @candidate = Candidate.find(params[:id])
    last_interview = @candidate.interviews.last
    last_interview.status = "accepted"
    last_interview.save
    @candidate.update(candidate_params)
    @interview = Interview.create(stage: @candidate.stage, user: current_user, candidate: @candidate)
    SendQuestions.perform_now(@interview)
    redirect_to candidate_path(@candidate)
  end

  def show
    @candidate = Candidate.find(params[:id])
    @role = @candidate.stage.role
    @interviews = @candidate.interviews.where(stage: @role.stages)
    @next_stage = @role.stages.where.not(id: @candidate.stages).order(:created_at).first
  end

  private

  def candidate_params
    params.require(:candidate).permit(:stage_id, :profile, :first_name, :last_name)
  end
end
