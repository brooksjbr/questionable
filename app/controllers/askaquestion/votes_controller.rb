require_dependency "askaquestion/application_controller"

module Askaquestion
  class VotesController < ApplicationController
    before_action :set_vote, only: [:destroy]

    # GET /votes
    # def index
    #   @votes = Askaquestion::Vote.all
    # end

    # GET /votes/1
    # def show
    #  end

    # GET /votes/new
    # def new
    #   @vote = Askaquestion::Vote.new
    # end

    # GET /votes/1/edit
    # def edit
    # end

    # POST /votes
    def create
      @vote = Askaquestion::Vote.new(vote_params)

      ## TODO: Should probably just return JSON
      respond_to do |format|
        if @vote.save
          #format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
          format.json { render json: true, status: 200}
        else
          #format.html { render action: 'new' }
          format.json { render json: @vote.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /votes/1
    # def update
    #   ## TODO: Return JSON
    #   respond_to do |format|
    #     if @vote.update(vote_params)
    #       format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
    #       format.json { head :no_content }
    #     else
    #       format.html { render action: 'edit' }
    #       format.json { render json: @vote.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end

    # DELETE /votes/1
    def destroy
      @vote.destroy
      respond_to do |format|
        format.json { render json: true, status: 200 }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_vote
        @vote = Askaquestion::Vote.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def vote_params
        params.require(:vote).permit(:user_id, :voteable_id, :voteable_type)
      end
  end
end
