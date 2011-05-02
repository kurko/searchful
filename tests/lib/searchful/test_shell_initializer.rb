require "test/unit"
require "searchful/shell_initializer"
require File.expand_path("../../../set_test_environment.rb", __FILE__)

class TestShellInitializer < Test::Unit::TestCase
  
  def test_should_exit?
    @obj = Shell::Initializer.new([])
    assert @obj.should_exit?
  end

  def test_get_command
    @obj = Shell::Initializer.new(["my_command"])
    assert !@obj.should_exit?
    assert_equal "my_command", @obj.get_command
  end
  
  def test_command_exist
    @obj = Shell::Initializer.new([])
    @obj.command = "mine"
    assert @obj.command_exist?
  end

  def test_command_does_no_exist
    @obj = Shell::Initializer.new(["zomg"])
    assert !@obj.command_exist?
  end
  
  def test_command_file
    @obj = Shell::Initializer.new([])
    @obj.command = "mine"
    assert_equal(
      File.expand_path("../../../../lib/searchful/commands/mine.rb", __FILE__),
      @obj.get_command_file )
  end
  
  def test_load_command
    require File.expand_path("../../../../lib/searchful/commands/mine.rb", __FILE__)
    @obj = Shell::Initializer.new([])
    assert_equal Searchful::Commands::Mine, @obj.run_command("mine", []).class
  end
  
  def test_run
    require File.expand_path("../../../../lib/searchful/commands/mine.rb", __FILE__)
    @obj = Shell::Initializer.new([])
    @obj.command = "mine"
    assert_equal Searchful::Commands::Mine, @obj.run.class
  end
end
