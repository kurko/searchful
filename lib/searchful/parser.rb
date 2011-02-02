module Searchful
  
  class Parser
    
    def self.count_words str
      return false if str.empty?
      
      str.split(/\S+/).size
      
    end
    
  end
  
end