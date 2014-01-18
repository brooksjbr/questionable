module Questionable
  class Question < ActiveRecord::Base
    self.table_name = 'questions'
    
    include UniqueIdFinder

    has_many :answers, dependent: :destroy

    validates :title, :content, :user_id, presence: true

    acts_as_seo_friendly :resource_id => :title, 
                         :seo_friendly_id_field => :unique_id, 
                         :seo_friendly_id_limit => 75,
                         :do_before_create => true
  end
end
