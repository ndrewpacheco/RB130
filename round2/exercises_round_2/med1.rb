# # 1

# class Device
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end

#   def listen
#     record yield if block_given?
#   end

#   def play
#     puts @recordings
#   end
# end

# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# # listener.play # Outputs "Hello World!"


# # 2

# class TextAnalyzer
#   def process
#     # your implementation

#     # read the file

#     analyzer_file = File.open("sample_text.txt")

#     yield analyzer_file.read
#     analyzer_file.close
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |file| puts "#{file.split("\n\n").count} paragraphs" }
# analyzer.process { |file| puts "#{file.split("\n").count} lines" }
# analyzer.process { |file| puts "#{file.split.count} words" }

# #output:

# 3 paragraphs
# 15 lines
# 126 words






# 3

#Modify the method below so that the display/output of items is moved to a block,
#and its implementation is left up to the user of the gather method.

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items) if block_given?
#   puts "Nice selection of food we have gathered!"
# end

# gather(items) { |things| puts "#{things.join(', ')}" }








# 4

# raven, finch, *raptors = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p raptors  # => ['hawk','eagle']

# #Based on the examples shown above,
# #write a method that takes an array as an argument.
# # The method should yield the contents of the array to a block,
# #which should assign your block variables in such a way that
# #it ignores the first two elements, and groups all remaining elements as
# # a raptors array.

# def type(birds)

#   yield birds
# end

# type(%w(raven finch hawk eagle)) do |_,_, *birds|
#   birds.each {|bird| puts bird }
# end






### 5


# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end


# gather(items) do |*items, wheat |
#   puts "#{items.join(", ")}"
#   puts wheat
# end


# # Let's start gathering food.
# # apples, corn, cabbage
# # wheat
# # We've finished gathering!

# gather(items) do |apples, *items, wheat |
#   puts apples
#   puts "#{items.join(", ")}"
#   puts wheat
# end


# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!


# gather(items) do |apples, *items |
#   puts apples
#   puts "#{items.join(", ")}"

# end


# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!



# gather(items) do | apples, corn, cabbage, wheat |
#   puts "#{apples}, #{corn}, #{cabbage} and #{wheat}"
# end


# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!









## 6

# def convert_to_base_8(n)
#   n.to_s(8).to_i # replace these two method calls
# end

# # The correct type of argument must be used below
# base8_proc = method(:convert_to_base_8).to_proc

# # We'll need a Proc object to make this code work. Replace `a_proc`
# # with the correct object
# [8, 10, 12, 14, 16, 33].map(&base8_proc)



# # expected return value
# [10, 12, 14, 16, 20, 41]





## 7

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1], array[index])
      else
        next if array[index - 1] <= array[index]
      end
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end
    break unless swapped
  end
  nil
end




array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)


