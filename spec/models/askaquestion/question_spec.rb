require 'spec_helper'

describe Askaquestion::Question do
  
  before do
    @user = User.find_by alias: "testuser1"
    @question = Askaquestion::Question.create!(title: "Test test", content: "test question", user_id: @user.id)
    @question.should be_valid
  end
  
  subject { @question }
  
  it { should respond_to :title }
  it { should respond_to :content }
  it { should respond_to :unique_id }
  it { should respond_to :user_id }
  it { should respond_to :buddy_image_url }
  it { should respond_to :alias }
  it { should respond_to :votes_count }
  
  describe "when title is not present" do
    before { @question.title = nil }     

    it { should_not be_valid }
  end
  
  describe "when content is not present" do
    before { @question.content = nil }     

    it { should_not be_valid }
  end
    
  describe "when user_id is not present" do
    before { @question.user_id = nil }     

    it { should_not be_valid }
  end
  
  describe "when a user asks a question their account info should be attached to the record" do
    before { @question }
    
    it { @question.alias.should eql(@user.alias) }
    it { @question.user_id.should eql(@user.id) }
    it { @question.buddy_image_url.should eql(@user.buddy_image_url) }
  end
    
  describe "when unique_id is not unique" do
     before do
       @user2 = User.find_by alias: "testuser2"
       @question2 = Askaquestion::Question.create!(title: "Test test", content: "dup title test", user_id: @user2.id)       
     end

     it { @question.unique_id.should_not eql(@question2.unique_id) }
  end
end