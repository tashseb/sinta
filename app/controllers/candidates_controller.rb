class CandidatesController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @candidate = Candidate.new(candidate_params)
    @role = Role.find(params[:role_id])
    @candidate.stage = @role.stages.order(created_at: :asc).first
    @candidate.status = "pending"
    if @candidate.save
      SlackNotifier::CLIENT.ping "🎉 New Candidate Added: #{@candidate.first_name} for the #{@role.title}Role 🎉"
      Interview.create(stage: @candidate.stage, user: current_user, candidate: @candidate)
      redirect_to role_path(@role, tab: "candidates")
    else
      # , status: :unprocessable_entity
    end
  end


  # def show
  #   @candidate = Candidate.find(params[:id])
  # end

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
    params.require(:candidate).permit(:stage_id, :status, :first_name, :last_name)
  end
end
