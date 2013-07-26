require 'spec_helper'

describe Askaquestion::Answer do
  before do
    @user = User.find_by alias: "testuser1"
    @question = Askaquestion::Question.create!(title: "Test test", content: "test question", user_id: @user.id)
    @question.should be_valid
    
    @user2 = User.find_by alias: "testuser2"
    @answer = Askaquestion::Answer.create!(question_id: @question.id, content: "test answer", user_id: @user2.id)
    @answer.should be_valid
  end
  
  subject { @answer }
  
  it { should respond_to :question_id }
  it { should respond_to :content }
  it { should respond_to :unique_id }
  it { should respond_to :user_id }
  it { should respond_to :buddy_image_url }
  it { should respond_to :alias }
  it { should respond_to :votes_count }
  
  describe "when question_id is not present" do
    before { @answer.question_id = nil }     

    it { should_not be_valid }
  end
  
  describe "when content is not present" do
    before { @answer.content = nil }     

    it { should_not be_valid }
  end
    
  describe "when user_id is not present" do
    before { @answer.user_id = nil }     

    it { should_not be_valid }
  end
  
  describe "when unique_id is not unique" do
     before do
       @user3 = User.find_by alias: "testuser3" 
       @answer2 = Askaquestion::Answer.create!(question_id: @question.id, content: "test answer", user_id: @user3.id)
       @answer2.should be_valid  
     end

     it { @answer.unique_id.should_not eql(@answer2.unique_id) }
  end
  
  describe "when question has an answer check answer count" do
    before { @question }

    it { @question.answers.size == 1}
  end
  
  describe "when a user answers a question their account info should be attached to the record" do
    before { @answer }
    
    it { @answer.alias.should eql(@user2.alias) }
    it { @answer.user_id.should eql(@user2.id) }
    it { @answer.buddy_image_url.should eql(@user2.buddy_image_url) }
  end
end