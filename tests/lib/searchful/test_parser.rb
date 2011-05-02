require "test/unit"
require "searchful/parser"

class TC_Search_Parser < Test::Unit::TestCase

  def test_paragraph_word_counting
    assert_equal 0, Searchful::Parser.count_paragraph_words("")
    assert_equal 2, Searchful::Parser.count_paragraph_words("<p>two words</p>")
    assert_equal 4, Searchful::Parser.count_paragraph_words("<p>one two </p><p>three four</p> ")
  end

  def test_title_word_counting
    assert_equal 0, Searchful::Parser.count_title_words("")
    assert_equal 2, Searchful::Parser.count_title_words("<h1>two words</h1>hey")
  end
  
  def test_word_counting
  
    assert_raise(ArgumentError) { Searchful::Parser.count_words }
    
    assert_equal false, Searchful::Parser.count_words("")
    assert_equal 7, Searchful::Parser.count_words("hey you, out there in the cold")
    # <hey> is a tag, not a word
    assert_equal 1, Searchful::Parser.count_words("<hey> you")
    assert_equal 2, Searchful::Parser.count_words("<p>two words </p> ")
    assert_equal 3, Searchful::Parser.count_words("<p>two words</p> Teste")
    
  end
    
end