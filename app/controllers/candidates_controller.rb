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
    @candidate.status = "pending"
    if @candidate.save
      SlackNotifier::CLIENT.ping "🎉 New Candidate Added: #{@candidate.first_name} #{@candidate.last_name} intereviewing for the #{@role.title} Role 🎉"
      Interview.create(stage: @candidate.stage, user: current_user, candidate: @candidate)
    else
      render :new, status: :unprocessable_entity
    end
  end


  # def update
  #   @candidate = Candidate.find(params[:id])
  #   if @candidate.update(candidate_params)
  #     redirect_to , status: :see_other
  #   else
  #     , status: :unprocessable_entity
  #   end
  # end

  private

  def candidate_params
    params.require(:candidate).permit(:stage_id, :profile, :first_name, :last_name)
  end
end
