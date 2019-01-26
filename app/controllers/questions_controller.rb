class QuestionsController < ApplicationController
	before_action :set_question, only: [:show, :update, :destroy]
  skip_before_action :authorize_request, only: [:index, :show]
  enum sort: { :latest, :pending_first, :needing_help }

  # GET /questions
  def index
    @questions = Question.all
    if sort.include? (params[:sort]) ? json_response(get_answers_ordered(params[:sort])) : json_response(@questions.sort_by{|question| question.created_at})
  end

  # POST /questions
  def create
    # create questions belonging to current userget_answers_ordered
    @question = current_user.questions.create!(question_params)
    json_response(@question, :created)
  end

  # GET /questions/:id
  def show
    json_response(@question)
  end

  # PUT /questions/:id
  def update
    @a_question = current_user.questions.find(params[:id])
    @a_question.update(question_params)
    head :no_content
  end

  #PUT /questions/:id/resolve
  def resolve
    @a_question = current_user.questions.find(params[:id])
    @answers = @a_question.answers
    @ids = @answers.collect { |e| e.id  }
    if @ids.include? (params[:answer_id])then
      @a_question.update(question_params)
      head :no_content
    end
  end


  # DELETE /questions/:id
  def destroy
    @question.destroy
    head :no_content
  end

  private

  def question_params
    # whitelist params
    params.permit(:title, :description, :status)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def get_answers_ordered(param)
    @questions = Question.all
    case param
    when "latest"
      result = @questions.sort_by{|question| question.created_at}
    when "pending_first"
      result = @questions.sort_by{|question| question.status = 0}
      result = result.sort_by{|question| question.created_at}
    when "needing_help"
      result = @questions.collect{|question| question.status = 0}
    end
    result
  end
end
