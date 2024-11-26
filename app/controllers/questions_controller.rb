class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token




  def create
    #debugger

    Question.create(
      body: params[:question][:body],
      user_id: params[:question][:user_id],
    )

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
  end

  def destroy
    @question = Question.find(params[:id]),
    @question.destroy
    redirect_to "/", notice: "question deleted"
  end

  def show
    #debugger
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  private
  def verify_authenticity_token
    # code here
  end
end
