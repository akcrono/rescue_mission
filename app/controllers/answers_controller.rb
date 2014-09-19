class AnswersController < ApplicationController

  def new
    @answer = Answer.new(question_id: params[:question_id])
    @question_id = params[:question_id]

  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:notice] = "Answer submitted"
      redirect_to "/questions/#{@answer.id}"
    else
      flash[:notice] = "Invalid entry"
      render :new
    end
  end

  def toggle_favorite
    @answer = Answer.find(params[:id])
    @answer.is_best = !@answer.is_best
    @answer.save
    redirect_to "/questions/#{@answer.question_id}"

  end

  private

  def answer_params
    params.require(:answer).permit(:title, :description, :question_id, :user_id)
  end

end
