class QuestionsController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def create
    #debugger

    question = Question.create(
      body: params[:question][:body],
      user_id: params[:question][:user_id],
    )

    redirect_to question_path(question)

    # redirect_to "/"
    # render text: "Запит оброблено"
  end

  def update
    #debugger

    @question = Question.find(params[:id])
    @question.update(
      body: params[:question][:body],
      user_id: params[:question][:user_id],
    )
    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  def show
    #debugger
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  # private
  # def verify_authenticity_token
  #   # code here
  # end
end
