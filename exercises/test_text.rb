require 'minitest/autorun'
require_relative 'test.rb'

class TextTest < Minitest::Test

  def setup
    sample_text = File.open("sample_text.txt")
    text = Text.new(sample_text)


    assert_equal sample_text.gsub("a", "e"), text.swap('a', 'e')

  end

  def test_swap

  end

  def teardown
    sample_text.close
  end
end