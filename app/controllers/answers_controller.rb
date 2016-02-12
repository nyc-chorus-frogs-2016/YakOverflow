class AnswersController < ApplicationController

  def index
    @answers = Answer.where(question_id: params[:question_id])
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.create(answer_params)
  end

  def show
    @answer = Answer.find_by(id: params[:id])
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
