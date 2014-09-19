class AnswersController < ApplicationController

  def new
    @answer = Answer.new(question_id: params[:question_id])
    @question_id = params[:question_id]

  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:notice] = "Answer submitted"
      redirect_to "/questions/#{@answer.question_id}"
    else
      flash[:notice] = "Invalid entry"
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :description, :question_id, :user_id)
  end

end
