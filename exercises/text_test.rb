require 'minitest/autorun'
require_relative 'text.rb'


class Test < Minitest::Test

  def setup
    @sample_text = File.open("sample_text.txt")
    @text = Text.new(@sample_text.read)

  end

  def test_swap

    swap_sample_text = File.open("swap_sample_text.txt")

    assert_equal swap_sample_text.read, @text.swap('a', 'e')
    swap_sample_text.close
  end

  def test_word_count

    assert_equal 72, @text.word_count

  end

  def teardown
    @sample_text.close
    puts "File has been closed: #{@sample_text.closed?}"
  end
end