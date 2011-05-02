module Searchful
  module Parser
    class Html
    
      def self.count_words str
        return false if str.empty?

        no_tags = str.gsub(/(<[.|\/]*\w*?>)/, " ").split(/\s+/)
        no_tags.delete_if { |x| x == "" }

        self.total_words no_tags
      end

      def self.total_words scan
        word_counting = scan.join(" ").split(/\s+/).size unless scan.nil?
        word_counting ||= 0
      end
    
      def self.count_title_words str
        return 0 if str.empty?

        scan = str.scan(/<h[0-9]>(.*?)<\/h[0-9]>/i)
        self.total_words scan
      end

      def self.count_paragraph_words str
        return 0 if str.empty?

        scan = str.scan(/<p>(.+?)<\/p>/i)
        self.total_words scan
      end
      
      def self.word_count word, string
        return false unless word
        
        count = string.scan(/[^a-z|<|<\\]#{word}[^a-z|>]/)
        count.size
      end
      
      def self.get_blocks string
        []
      end
    
    end
  end
end