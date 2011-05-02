require "net/http"
require "uri"
require File.expand_path("../../parsers/html.rb", __FILE__)

module Searchful::Commands

  class Mine < Searchful::Engine

    def run
      
      if @arguments[0].nil?
        puts "You must to specify a URI, e.g. http://www.google.com."
        exit
      end
      
      html = fetch( @arguments[0] )
      puts "Counting words..."
      puts "Words found: " + Searchful::Parser.count_words(html.body).to_s
      
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