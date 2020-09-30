# #1
# class Tree
#   include Enumerable

#   def each

#   end
# end


# 2

#Write a method that takes an optional block.
# If the block is specified, the method should execute it,
#and return the value returned by the block.

#If no block is specified, the method should simply return the String
#'Does not compute.'.


# def compute
#   block_given? ? yield : 'Does not compute.'
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'


# 3
# Write a method that takes a sorted array of integers as an argument,
# and returns an array that includes all of the missing integers (in order)
# between the first and last elements of the argument.

# # Examples:

# # Copy Code

# def missing(arr)

#   (arr.first..arr.last).to_a.reject do |num|
#     arr.include?(num)
#   end
# end

# p missing([-3, -2, 1, 5]) #== [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) #== []
# p missing([1, 5]) #== [2, 3, 4]
# p missing([6]) #== []








# 4
# def divisors(num)
# #Write a method that returns a list of all of the divisors
# # of the positive integer passed in as an argument.

# # The return value can be in any sequence you wish.

# # first iterate through a range 1..num,
# # if

#   (1..num).select do |n|

#     num % n == 0
#   end
# end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute









# 5

# FIRST_ALPHA = ("a".."m").to_a
# SECOND_ALPHA = ("n".."z").to_a

# def reg_to_rot(txt_file)
#   txt_file.each do |line|
#     new_line = line.chomp.chars
#     new_line.map! do |char|
#       if FIRST_ALPHA.include?(char.downcase)
#         idx = FIRST_ALPHA.index(char.downcase)
#         SECOND_ALPHA[idx]
#       elsif SECOND_ALPHA.include?(char.downcase)
#         idx = SECOND_ALPHA.index(char.downcase)
#         FIRST_ALPHA[idx]
#       else
#         char
#       end
#     end
#     puts new_line.join.split.map(&:capitalize).join(' ')
#   end
# end

# pioneers = File.open("rot_names.txt")

# reg_to_rot(pioneers)
# pioneers.close




# 6
# Your method should stop processing elements of the Array as soon as
#the block returns true.

# If the Array is empty, any? should return false,
# regardless of how the block is defined.

# Your method may not use any standard ruby method that is named
# all?, any?, none?, or one?.


def any?(arr)

  # return true if any of the block returns true at any time
  arr.each {|item| return true if yield(item)}
  false
end

# p any?([1, 3, 5, 6]) { |value| value.even? } == true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false






# 7
# Write a method called all? that behaves similarly for Arrays.
# It should take an Array as an argument, and a block.
# It should return true if the block returns true for all of the element values.
# Otherwise, it should return false.

# Your method should stop processing elements of the Array as soon as the block returns false.

# If the Array is empty, all? should return true, regardless of how the block is defined.

# Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

# Examples:

# Copy Code

def all?(collection)

  # return false if any of yield iterations are false
  collection.each {|item| return false unless yield(item)}
  true
end

# p all?([1, 3, 5, 6]) { |value| value.odd? } == false
# p all?([1, 3, 5, 7]) { |value| value.odd? } == true
# p all?([2, 4, 6, 8]) { |value| value.even? } == true
# p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p all?([1, 3, 5, 7]) { |value| true } == true
# p all?([1, 3, 5, 7]) { |value| false } == false
# p all?([]) { |value| false } == true







# 8

# Write a method called none? that behaves similarly for Arrays.
# It should take an Array as an argument, and a block.
# It should return true if the block returns false for all of the element values.
# Otherwise, it should return false.

# Your method should stop processing elements of the Array
# as soon as the block returns true.

# If the Array is empty, none? should return true,
# regardless of how the block is defined.

# Your method may not use any of the following methods
# from the Array and Enumerable classes: all?, any?, none?, one?. You may, however, use either of the methods created in the previous two exercises.


def none?(arr)

  # if any iteration of the block returns true, this method should return false
  arr.each {|item| return false if yield(item)}
  true
end
# p none?([1, 3, 5, 6]) { |value| value.even? } == false
# p none?([1, 3, 5, 7]) { |value| value.even? } == true
# p none?([2, 4, 6, 8]) { |value| value.odd? } == true
# p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p none?([1, 3, 5, 7]) { |value| true } == false
# p none?([1, 3, 5, 7]) { |value| false } == true
# p none?([]) { |value| true } == true






## 9

def one?(arr)

  counter = 0
  arr.each {|item| counter += 1 if yield(item)}
  counter == 1
end


# p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# p one?([1, 3, 5, 7]) { |value| true }           # -> false
# p one?([1, 3, 5, 7]) { |value| false }          # -> false
# p one?([]) { |value| true }                     # -> false
### 10


# Count Items
# Write a method that takes an array as an argument,
# and a block that returns true or false depending on the value of the array
#element passed to it.
# The method should return a count of the number of times the block returns true.

def count(arr)

  counter = 0
  arr.each {|item| counter += 1 if yield(item)}
  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2


