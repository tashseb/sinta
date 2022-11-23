class QuestionsController < ApplicationController
  def create
    @stage = Stage.find(params[:stage_id])
    @question = Question.new(question_params)
    @question.stage = @stage
    if @question.save
      redirect_to role_path(@stage.role)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:description)
  end
end
