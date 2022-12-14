class StagesController < ApplicationController
  def index
    @stages = Stage.all
  end

  def create
    @stage = Stage.new(stage_params)
    @role = Role.find(params[:role_id])
    @stage.role = @role
    if @stage.save
      redirect_to role_path(@role, tab: @stage.name)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def stage_params
    params.require(:stage).permit(:name, :role_id)
  end

  def create_default_questions
    Stage::BASE_STAGES[name].each do |question|
      Question.create(description: question, stage: self)
    end
  end
end
