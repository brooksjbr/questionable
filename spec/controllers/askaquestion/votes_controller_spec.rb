require 'spec_helper'

## BASIC VALIDATION TESTS FOR SUCCESSFUL REQUESTS ON ROUTES AND RESPONSE
## TODO: ADD TESTS FOR FAILURE RESPONSE
describe Askaquestion::VotesController do
  routes { Askaquestion::Engine.routes }
  
  before do
    @user = User.find_by alias: "testuser1"
    @question = Askaquestion::Question.create!(title: "Test question", content: "test question", user_id: @user.id)
    
    @user2 = User.find_by alias: "testuser2"
    @answer = Askaquestion::Answer.create!(question_id: @question.id, content: "test answer", user_id: @user2.id)
  end

  it "posts votes#create" do
    @user3 = User.find_by alias: "testuser3"
    post :create, :vote => {voteable_id: @question.id, voteable_type: @question.class.to_s, user_id: @user3.id}, :format => :json
    expect(response.status).to eq(200)
    expect(@question.votes.size).to eq(1)
  end
  
  it "delete votes#destroy" do
    @user3 = User.find_by alias: "testuser3"
    post :create, :vote => {voteable_id: @question.id, voteable_type: @question.class.to_s, user_id: @user3.id}, :format => :json
    expect(response.status).to eq(200)
    expect(@question.votes.size).to eq(1)
    
    vote = Askaquestion::Vote.find_by voteable_id: @question.id, user_id: @user3.id
    delete :destroy, id: vote.id,  :format => :json
    expect(response.status).to eq(200)
    expect(@question.votes.size).to eq(0)
  end
  
end