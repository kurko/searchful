module Shell
  
  class Run
    
    # all arguments passed
    @argv
    
    def initialize argv
      @argv = argv
      
      @options = Shell::Parser.get_options @argv
      @command = Shell::Parser.get_command @argv
      @arguments = Shell::Parser.get_arguments @argv
    end
    
  end
  
  class Input
    
    def self.text
      STDOUT.flush
      STDIN.gets.strip
    end
    
    def self.yesno message
      STDOUT.flush
      has_result = false
      while has_result == false
        print message.strip + " "
        input = STDIN.gets.strip
        
        if input == "yes" or input == "y" then
          final_input = "yes"
        elsif input == "no" or input == "n" then
          final_input = "no"
        end
        
        if ( final_input == "yes" or final_input == "no" )
          has_result = true
        end
      end
      
      if final_input == "yes"
        result = true
      else
        result = false
      end
      result
    end
    
  end
  
  class Parser
    
    # defines the command of the application (e.g. 'push' in uplift push)
    def self.get_command(argv = [])
      command = ""
      argv.each do |e|
        if (e[0,2] != "--" and e[0,1] != "-") then
            command = e
            break
        end
      end
      command = nil if command.empty?
      command
    end # get_command
    
    # get only options in ARGV (arguments starting with _ or __)
    def self.get_options argv
      @options = []
    
      argv.each do |e|
        if e[0,2] == "--" 
          @options << e[2,e.length]
        elsif e[0,1] == "-"
          @options << e[1,e.length]
        end
      end
      @options
    end # get_options
    
    # get arguments. arguments are anything written besides the command and options.
    # in 'push today --list', 'today' is the argument
    def self.get_arguments argv = []
      @arguments = Array.new
      
      argv.each_with_index do |e,index|
        next if index == 0
        if e[0,2] != "--" and e[0,1] != "-"
          @arguments << e[0,e.length]
        end
      end
      
      @arguments
    end # get_options
    
    def self.is_option option, argv = Array.new
      argv_options = self.get_options argv
      argv_options.include?(option)
    end # is_option
    
  end
  
end
