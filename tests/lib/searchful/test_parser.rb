require "test/unit"
require "searchful/parsers/html"

class TestHtmlParser < Test::Unit::TestCase

  def setup
    @nytimes = File.open( File.expand_path("../../../resources/test_camp/html/nytimes_news.html", __FILE__) ).read
    @controlled_html = File.open( File.expand_path("../../../resources/test_camp/html/controlled_html.html", __FILE__) ).read
    @text_blocks_html = File.open( File.expand_path("../../../resources/test_camp/html/text_blocks.html", __FILE__) ).read
  end
  
  def test_paragraph_word_counting
    assert_equal 0, Searchful::Parser::Html.count_paragraph_words("")
    assert_equal 2, Searchful::Parser::Html.count_paragraph_words("<p>two words</p>")
    assert_equal 4, Searchful::Parser::Html.count_paragraph_words("<p>one two </p><p>three four</p> ")
  end

  def test_title_word_counting
    assert_equal 0, Searchful::Parser::Html.count_title_words("")
    assert_equal 2, Searchful::Parser::Html.count_title_words("<h1>two words</h1>hey")
  end
  
  def test_word_counting
    assert_raise(ArgumentError) { Searchful::Parser::Html.count_words }
    
    assert_equal false, Searchful::Parser::Html.count_words("")
    assert_equal 7, Searchful::Parser::Html.count_words("hey you, out there in the cold")
    # <hey> is a tag, not a word
    assert_equal 1, Searchful::Parser::Html.count_words("<hey> you")
    assert_equal 2, Searchful::Parser::Html.count_words("<p>two words </p> ")
    assert_equal 3, Searchful::Parser::Html.count_words("<p>two words</p> Teste")
  end
  
  def test_count_specific_word
    assert_equal 4, Searchful::Parser::Html.word_count("are", @nytimes)
    assert_equal 5, Searchful::Parser::Html.word_count("have", @controlled_html)
    assert_equal 2, Searchful::Parser::Html.word_count("in", @controlled_html)
    assert_equal 2, Searchful::Parser::Html.word_count("p", @controlled_html)
  end
  
  def test_get_text_blocks
    blocks = Searchful::Parser::Html.get_blocks(@text_blocks_html)
    assert_equal Array, blocks.class
    assert_equal 3, blocks.size
    assert_equal "This is a text block", blocks[0][:text]
    assert_equal "div", blocks[0][:element]
    assert_equal 20, blocks[0][:size]
  end
    
end