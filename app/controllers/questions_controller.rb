class QuestionsController < ApplicationController

  def index
    @questions = Question.search(params[:search]).order(created_at: :desc)
  end

  def show
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    @question = Question.find(params[:id])
    @question.title = markdown.render(@question.title)
    @question.description = markdown.render(@question.description)
    @answers = Answer.where(question_id: params[:id]).order(created_at: :desc)
    @answers.each do |answer|
      answer.title = markdown.render(answer.title)
      answer.description = markdown.render(answer.description)
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    binding.pry
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
    params.require(:question).permit(:title, :description, :user_id)
  end

end
