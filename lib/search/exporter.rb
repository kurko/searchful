require "rubygems"
require "activerecord"

module Search
  
  class Exporter < ActiveRecord::Base
    
    def initialize
      
      ActiveRecord::Base.establish_connection(
        :adapter => "mysql",
        :host => "127.0.0.1",
        :username => "root",
        :password => "",
        :database => "search"
      )
      
    end
    
  end

end