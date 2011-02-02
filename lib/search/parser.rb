module Search
  
  class Parser
    
    def self.count_words str
      return false if str.empty?
      
      puts str.split(/\s+/).inspect
      str.split(/\S+/).size
      
      
    end
    
  end
  
end