require_dependency "questionable/application_controller"

module Questionable
  class AnswersController < ApplicationController
    before_action :set_answer, only: [:new, :create, :index, :show, :edit, :update, :destroy]

    # GET /answers
    def index
      @answers = Questionable::Answer.all
    end

    # GET /answers/1
    def show
    end

    # GET /answers/new
    def new
      @answer = Questionable::Answer.new(:question_id => @question.id)
    end

    # GET /answers/1/edit
    def edit
    end

    # POST /answers
    def create
      @answer = Questionable::Answer.new(answer_params)

      respond_to do |format|
        if @answer.save
          format.html { redirect_to @question, notice: 'Answer was successfully created.' }
          format.json { render action: 'show', status: :created, location: @answer }
        else
          format.html { render action: 'new' }
          format.json { render json: @answer.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /answers/1
    def update
      respond_to do |format|
        if @answer.update(answer_params)
          format.html { redirect_to question_path(@question), notice: 'Answer was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @answer.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /answers/1
    def destroy
      @answer.destroy
      respond_to do |format|
        format.html { redirect_to question_path(@question) }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_answer
        @question = Questionable::Question.find(params[:question_id])
        @answer = Questionable::Answer.find(params[:id]) if params.has_key?("id") and !@question.nil?
      end

      # Only allow a trusted parameter "white list" through.
      def answer_params
        params.require(:answer).permit(:question_id, :content, :unique_id, :user_id, :buddy_image_url, :alias, :votes_count)
      end
  end
end
