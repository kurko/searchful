require "test/unit"
require "search/parser"

class TC_Search_Parser < Test::Unit::TestCase
  
  def test_word_counting
  
    assert_raise(ArgumentError) { Search::Parser.count_words }
    
    assert_equal false, Search::Parser.count_words("")
    assert_equal 7, Search::Parser.count_words("hey you, out there in the cold")
    assert_equal 6, Search::Parser.count_words("<hey> you, out-there in the cold")
    
  end
  
  def test_words_in_html
    assert_equal 2, Search::Parser.count_words("<p>two words</p>")
    assert_equal 2, Search::Parser.count_words("<p>two words </p> ")
  
  end
  
end