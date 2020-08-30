class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end

sample = File.open("sample_text.txt")
new_text = Text.new(sample.read)

p new_text.word_count