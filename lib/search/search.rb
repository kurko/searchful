module Search
  
  class Engine < Shell::Run

    def initialize argv
      
      super argv
      @command
      @errors = Array.new
      
      # has_compulsory_config?
      
      @connection = nil
      
      # shows help whenever it's called for
      if Shell::Parser.is_option "help", @argv then
        help
        exit
      end
      
      run

    end
    
  end
    

  
end