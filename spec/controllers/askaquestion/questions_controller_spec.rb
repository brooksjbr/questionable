require 'spec_helper'

## BASIC VALIDATION TESTS FOR SUCCESSFUL REQUESTS ON ROUTES AND RESPONSE
## TODO: ADD TESTS FOR FAILURE RESPONSE
describe Askaquestion::QuestionsController do
  routes { Askaquestion::Engine.routes }
  
  before do
    @user = User.find_by alias: "testuser1"
    Askaquestion::Question.create!(title: "Test 1", content: "test 1 question", user_id: @user.id)
    Askaquestion::Question.create!(title: "Test 2", content: "test 2 question", user_id: @user.id)
  end

  it "gets questions#index" do
    get :index
    expect(response).to be_success
    expect(response.status).to eq(200)
  end

  it "gets questions#new" do
    get :new
    expect(response).to be_success
    expect(response.status).to eq(200)
  end

  it "posts questions#create" do
    post :create, :question => {:title => "Test 3", :content => "test 3 question", :user_id => @user.id}
    expect(response.status).to eq(302)
    question = Askaquestion::Question.find_by unique_id: "test-3"
    response.should redirect_to(question_path(question))
  end

  it "posts questions#edit" do
    get :edit, :id => "test-3"
    expect(response).to be_success
    expect(response.status).to eq(200)
  end
  
  it "put questions#update" do
    put :update, id: "test-2", :question => {content: "test 2 update question"}
    expect(response.status).to eq(302)
    question = Askaquestion::Question.find_by unique_id: "test-2"
    response.should redirect_to(question_path(question))
  end
  
  it "get questtion#show" do
    get :show, id: "test-2"
    expect(response).to be_success
    expect(response.status).to eq(200)
  end
  
  it "delete questtion#destroy" do
    delete :destroy, id: "test-2"
    expect(response.status).to eq(302)
    response.should redirect_to(questions_path)
  end
  
end

