module Questionable
  class Answer < ActiveRecord::Base
    self.table_name = 'answers'
    
    include UniqueIdFinder

    belongs_to :question, dependent: :destroy, counter_cache: true
    has_many :votes, :as => :voteable

    validates :question_id, :content, :user_id, presence: true

    acts_as_seo_friendly :resource_id => :content, 
                         :seo_friendly_id_field => :unique_id, 
                         :seo_friendly_id_limit => 75,
                         :do_before_create => true
  end
end
