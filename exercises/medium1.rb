# # 1

# # Listen for something, and if anything is said,
# #record it for later use. If nothing is said, then do not record anything.


# class Device
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end

#   def listen
#     @recordings << yield if block_given?
#   end

#   def play
#     puts @recordings.last
#   end
# end


# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# listener.play # Outputs "Hello World!"








# 2


# class TextAnalyzer
#   def process
#     file = File.open("sample_text.txt")
#     yield(file)
#     file.close
#   end
# end

# analyzer = TextAnalyzer.new

# analyzer.process do |file|
#   amount = 1
#   file.each do |line|
#     amount += 1 if line.size < 2
#   end
#   puts "#{amount} paragraphs"
# end

# analyzer.process do |file|
#   amount = 0
#   file.each do |line|
#     amount += line.split.size
#   end
#   puts "#{amount} words"
# end

# analyzer.process do |file|
#   amount = 0
#   file.each do |line|
#     amount += 1
#   end
#   puts "#{amount} lines"
# end

# # 3 paragraphs
# # 15 lines
# # 126 words









# 3
# Passing Parameters Part 1
# Modify the method below so that the display/output of items is moved to a block,
# and its implementation is left up to the user of the gather method.


# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "Nice selection of food we have gathered!"
# end

# gather(items) do
#   puts "#{items.join(', ')}"
# end





# 3
# Suppose we want to organize our array contents into groups,
#where variables represent category names.

# Can we do that without extracting items directly from the array
# based on their indices?

#We can use the splat operator(*) to do something like this:

# def birds(arr)
#   yield(arr)
# end

# birds(%w(raven finch hawk eagle)) do |_, _, *raptors|

#   p raptors  # => ['hawk','eagle']
# end



# raven, finch, *raptors = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p raptors  # => ['hawk','eagle']
# Based on the examples shown above,
#write a method that takes an array as an argument.

#The method should yield the contents of the array to a block,
#which should assign your block variables in such a way that

# it ignores the first two elements,
# and groups all remaining elements as a raptors array.



# 4

#  items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end

#a


# gather(items) do | *produce, wheat |
#   puts produce.join(", ")
#   puts wheat
# end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# b

# gather(items) do |apples, *produce, wheat|
#   puts apples
#    puts produce.join(", ")
#    puts wheat
# end
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# c

# gather(items) do |apples, *produce |
#   puts apples
#   puts produce.join(", ")
# end
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!


# 6

#Using this information, together with the course page linked above,
# fill in the missing part of the following code so we can convert
# an array of integers to base 8 (octal numbers).

# Use the comments for help in determining where to make your modifications,
# and make sure to review the "Approach/Algorithm" section for this exercise;
# it should prove useful.


# def convert_to_base_8(n)
#   n.to_s(8).to_i # replace these two method calls
# end

# # The correct type of argument must be used below
# base8_proc = method(:convert_to_base_8).to_proc

# # We'll need a Proc object to make this code work. Replace `a_proc`
# # with the correct object
# p [8, 10, 12, 14, 16, 33].map(&base8_proc)




#The expected return value of map on this number array should be:

#[10, 12, 14, 16, 20, 41]








# 7


# Your task in this assignment is to modify #bubble_sort!
# so it takes an optional block that determines
#which of two consecutive elements will appear first in the results.



def bubble_sort!(array)

  loop do
    swapped = false
    1.upto(array.size - 1) do |index|

      if block_given?
        next if yield(array[index - 1], array[index] )
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
# Examples:

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first >= second }
# p array# == [7, 5, 3]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)