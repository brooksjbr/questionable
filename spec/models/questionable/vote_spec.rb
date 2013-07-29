require 'spec_helper'

describe Questionable::Vote do
  before do
    @user = User.find_by alias: "testuser1"
    @question = Questionable::Question.create!(title: "Test test", content: "test question", user_id: @user.id)
    @question.should be_valid

    @user = User.find_by alias: "testuser2"
    @vote = Questionable::Vote.create!(:voteable_id => @question.id, :voteable_type => @question.class.to_s, :user_id => @user.id)
    @vote.should be_valid
    
    @user = User.find_by alias: "testuser3"
    @answer = Questionable::Answer.create!(question_id: @question.id, content: "test answer", user_id: @user.id)
    @answer.should be_valid
    
    user_ids = User.all.map {|user| user.id}
    user_ids.each do |user_id|
      Questionable::Vote.create!(:voteable_id => @answer.id, :voteable_type => @answer.class.to_s, :user_id => user_id)
    end
  end
  
  subject { @vote }
  
  it { should respond_to :voteable_id }
  it { should respond_to :voteable_type }
  it { should respond_to :user_id }
  
  describe "when voteable_id is not present" do
    before { @vote.voteable_id = nil }

    it { should_not be_valid }
  end  
  
  describe "when user_id is not present" do
    before { @vote.user_id = nil }

    it { should_not be_valid }
  end  
  
  describe "when question votes are counted" do
    before { @question }

    it { @question.votes.size == 1 }
  end
  
  describe "when answer votes are counted" do
    before { @answer }

    it { @answer.votes.size == 1 }
  end
end