class QuestionsController < ApplicationController
	before_action :set_question, only: [:show, :update, :destroy]
  skip_before_action :authorize_request, only: [:index, :show]

  # GET /questions
  def index
    @questions = Question.all
    if params[:sort].present? then
      if params[:sort] == 'pending_first'
        json_response(@questions.sort_by{|question| question.status})
      elsif params[:sort] == 'needing_help'
          json_response(@questions.collect{|question| question.status==0})
        else
          json_response(@questions.sort_by{|question| question.created_at})

      end
    else
      json_response(@questions.sort_by{|question| question.created_at})
    end
  end

  # POST /questions
  def create
    # create todos belonging to current user
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
    if @ids.include? (params[:amswer_id])then
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
end
