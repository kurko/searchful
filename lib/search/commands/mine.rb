require "net/http"
require "uri"

require "lib/search/parser"

module Search::Commands

  class Mine < Search::Engine

    def run
      
      if @arguments[0].nil?
        puts "You must to specify a URI, e.g. www.google.com."
        exit
      end
      
      html = fetch( 'http://www.google.com' )
      
      puts "Ran!"
    end

    def fetch(uri_str, limit=10)
      fail 'http redirect too deep' if limit.zero?
      puts "Trying: #{uri_str}"
      response = Net::HTTP.get_response(URI.parse(uri_str))
      case response
        when Net::HTTPSuccess then response
        when Net::HTTPRedirection then fetch(response['location'], limit-1)
        else response.error!
      end
    end
        
    def help
      puts "Starts mining."
    end
  
  end
end