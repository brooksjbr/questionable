module Questionable
  class Vote < ActiveRecord::Base
    
    ## NOTES: Bidness Rulz??
    ## Can a user vote on their question/answer?
    ## Can a user vote more than once on a question/answer?
    ## Can a user change their vote?? Unvote
    ##
    ## Should there be a vote table? Maybe just a count table - use STI for (votes, likes, shares, etc...)
    ## If so, consider changing type to type_id for better performance accross count types.
    
    self.table_name = 'votes'
    
    belongs_to :voteable, 
               :polymorphic => true, 
               dependent: :destroy, 
               counter_cache: true

    validates :voteable_id, 
              :user_id, 
              presence: true
  end
end
