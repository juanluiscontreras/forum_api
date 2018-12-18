class AnswersController < ApplicationController
  before_action :set_question
  before_action :set_question_answer, only: [:show, :update, :destroy]
  skip_before_action :authorize_request, only: [:index, :show, :update]


  # GET /questions/:question_id/answers
  def index
    json_response(@question.answers)
  end

  # GET /questions/:question_id/answers/:id
  def show
    json_response(@answer)
  end

  # POST /questions/:question_id/answers
  def create
    @question.answers.create!(answer_params)
    json_response(@question, :created)
  end

  # PUT /questions/:question_id/answers/:id
  def update
    @answer.update(answer_params)
    head :no_content
  end

  # DELETE /questions/:question_id/answers/:id
  def destroy
    @answer.destroy
    head :no_content
  end

  private

  def answer_params
    params.permit(:content)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_question_answer
    @answer = @question.answers.find_by!(id: params[:id]) if @question
  end
end
