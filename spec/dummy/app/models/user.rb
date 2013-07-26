class User < ActiveRecord::Base
  has_many :questions, class_name: "Askaquestion::Question"
  has_many :answers, class_name: "Askaquestion::Answer"
  has_many :votes, class_name: "Askaquestion::Vote"
  
  include ExtendAskaquestion
end
