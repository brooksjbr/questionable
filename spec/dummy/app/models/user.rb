class User < ActiveRecord::Base
  has_many :questions, class_name: "Questionable::Question"
  has_many :answers, class_name: "Questionable::Answer"
  has_many :votes, class_name: "Questionable::Vote"
  
  include ExtendQuestionable
end
