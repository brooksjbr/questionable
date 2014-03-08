module Questionable
  class AnswersController < ApplicationController
    before_action :set_answers, only: [:index, :show]
    before_action :set_answer, only: [:update, :destroy]
    before_action :create_answer, only: [:new, :create]

    # GET /answers
    def index
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
      @answer = Questionable::Answer.new(answer_params.merge(question_id: @question.id))

      respond_to do |format|
        if @answer.save
          format.html { redirect_to @question, notice: 'Answer was successfully created.' }
          format.json { render json: @answer }
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
          format.html { redirect_to question_path(@answer.question), notice: 'Answer was successfully updated.' }
          format.json { render json: @answer }
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
        format.html { redirect_to question_path(@answer.question) }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_answers
        @question = (Questionable::Question.where(unique_id: params[:question_id]).includes(:answers)).first
      end
      
      def set_answer
        @answer = Questionable::Answer.find(params[:id])
      end
      
      def create_answer
        @question = Questionable::Question.find(params[:question_id])
      end

      # Only allow a trusted parameter "white list" through.
      def answer_params
        params.require(:answer).permit(:content, :user_id)
      end
  end
end
