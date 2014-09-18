class QuestionsController < ApplicationController

  def index
    @questions = Question.search(params[:search]).order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: params[:id]).order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question submitted"
      redirect_to questions_path
    else
      flash[:notice] = "Invalid entry"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question updated"
      redirect_to "/questions/#{params[:id]}"
    else
      flash[:notice] = "Invalid entry"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to "/questions"
  end
  private

  def question_params
    params.require(:question).permit(:title, :description)
  end

end
