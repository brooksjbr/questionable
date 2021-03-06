# Extending AAQ classes to test one-to-many associations with User class
# These resources should probably be split up into separate modules to extend specific classes. 
module ExtendQuestionable
  extend ActiveSupport::Concern

  Questionable::Question.class_eval do
    belongs_to :user
    before_save :set_user
    
    private
      def set_user
        user = User.find(self.user_id)    
        if !user.nil?
          self.buddy_image_url = user.buddy_image_url
          self.alias = user.alias
        end
      end
  end
  
  Questionable::Answer.class_eval do
    belongs_to :user
    before_save :set_user
    
    private
      def set_user
        user = User.find(self.user_id)    
        if !user.nil?
          self.buddy_image_url = user.buddy_image_url
          self.alias = user.alias
        end
      end
  end
  
  # NOTE: Don't know how user auth will fit into questionable gem so spoofing user for tests.
  Questionable::QuestionsController.class_eval do
    before_action :spoof_user, only: :new

    def spoof_user
      @user = User.first
    end
  end
    
end