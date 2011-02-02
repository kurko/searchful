require "test/unit"
require "searchful/parser"

class TC_Search_Parser < Test::Unit::TestCase
  
  def test_word_counting
  
    assert_raise(ArgumentError) { Searchful::Parser.count_words }
    
    assert_equal false, Searchful::Parser.count_words("")
    assert_equal 7, Searchful::Parser.count_words("hey you, out there in the cold")
    # <hey> is a tag, not a word
    assert_equal 1, Searchful::Parser.count_words("<hey> you")
    
  end
  
  def test_words_in_html
    
    assert_equal 2, Searchful::Parser.count_words("<p>two words</p>")
    assert_equal 2, Searchful::Parser.count_words("<p>two words </p> ")
  
  end
  
end