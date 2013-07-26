module UniqueIdFinder
  extend ActiveSupport::Concern
  
  module ClassMethods    
    ## if input is integer use AR find, otherwise find_by_unique_id
    def find(input)
      input.is_a?(Integer) ? super : find_by(unique_id: input)
    end
  end
end