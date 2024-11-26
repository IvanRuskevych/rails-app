class QuestionsController < ApplicationController
  # skip_before_action :verify_authenticity_token

  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def set_question
    @question = Question.find(params[:id])
  end

  def create
    # question = Question.create(
    #   body: params[:question][:body],
    #   user_id: params[:question][:user_id],
    # )

    question = Question.create(question_params)
    redirect_to question_path(question)

    # redirect_to "/"
    # render text: "Запит оброблено"
  end

  def update
    #debugger

    # @question.update(
    #   body: params[:question][:body],
    #   user_id: params[:question][:user_id],
    # )

    @question.update(question_params)
    redirect_to question_path(@question)
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  def show
    #debugger
    @question
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
    @question
  end

  private
  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  # private
  # def verify_authenticity_token
  #   # code here
  # end
end
