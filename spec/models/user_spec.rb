require 'spec_helper'

describe User do
  before do
    @user = User.find_by alias: "testuser1"
  end
  
  subject { @user }
  
  it { should respond_to :questions }
  it { should respond_to :answers }
  it { should respond_to :votes }
end
