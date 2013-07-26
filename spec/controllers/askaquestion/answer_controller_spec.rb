require 'spec_helper'

## BASIC VALIDATION TESTS FOR SUCCESSFUL REQUESTS ON ROUTES AND RESPONSE
## TODO: ADD TESTS FOR FAILURE RESPONSE
describe Askaquestion::AnswersController do
  routes { Askaquestion::Engine.routes }
  
  before do
    @user = User.find_by alias: "testuser1"
    @question = Askaquestion::Question.create!(title: "Test question", content: "test question", user_id: @user.id)
    
    @user2 = User.find_by alias: "testuser2"
    @answer = Askaquestion::Answer.create!(question_id: @question.id, content: "test answer", user_id: @user2.id)
  end

  it "gets answers#index" do
    get :index, question_id: @question.unique_id
    expect(response).to be_success
    expect(response.status).to eq(200)
  end

  it "gets answers#new" do
    get :new, question_id: "test-question"
    expect(response).to be_success
    expect(response.status).to eq(200)
  end
  
  it "posts answers#create" do
    @user3 = User.find_by alias: "testuser2"
    post :create, question_id: @question.unique_id, :answer => {question_id: @question.id, :content => "test answer", :user_id => @user3.id}
    expect(response.status).to eq(302)
    response.should redirect_to(question_path(@question))
  end
  
  it "posts answers#edit" do
    get :edit, question_id: @question.unique_id, id: @answer.unique_id
    expect(response).to be_success
    expect(response.status).to eq(200)
  end
  
  it "put answers#update" do
    put :update, question_id: @question.unique_id, id: @answer.unique_id, :answer => {content: "test update question"}
    expect(response.status).to eq(302)
    response.should redirect_to(question_path(@question))
  end
  
  it "get questtion#show" do
    get :show, question_id: @question.unique_id, id: @answer.unique_id
    expect(response).to be_success
    expect(response.status).to eq(200)
  end
  
  it "delete questtion#destroy" do
    delete :destroy, question_id: @question.unique_id, id: @answer.unique_id
    expect(response.status).to eq(302)
    response.should redirect_to(question_path(@question))
  end
  
end
