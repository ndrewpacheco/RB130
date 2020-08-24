#1
# class Tree
#   include Enumerable
# end


#2
# Write a method that takes an optional block.
#If the block is specified, the method should execute it,
#and return the value returned by the block.
# If no block is specified, the method should simply return the String
#'Does not compute.'.

# Examples:

# def compute
#   block_given? ? yield : "Does not compute."
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'



#3
# Find Missing Numbers
# Write a method that takes a sorted array of integers as an argument,
#and returns an array that includes all of the missing integers
#(in order) between the first and last elements of the argument.

# Examples:
#take the first element and last element range into an array


# def missing(arr)
#   full_arr = (arr.first..arr.last).to_a
#   # select items that are from full arr which are not in arr

#   full_arr.reject {|item| arr.include?(item)}
# end
# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []

# 4

# Write a method that returns a list of all of the divisors of the
# positive integer passed in as an argument.

# The return value can be in any sequence you wish.

# Examples

# def divisors(num)

#   (1..num).select {|n| num % n == 0 }

# end
# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute




# #5
# ENCRYPTED_PIONEERS = [
#   'Nqn Ybirynpr',
#   'Tenpr Ubccre',
#   'Nqryr Tbyqfgvar',
#   'Nyna Ghevat',
#   'Puneyrf Onoontr',
#   'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
#   'Wbua Ngnanfbss',
#   'Ybvf Unvog',
#   'Pynhqr Funaaba',
#   'Fgrir Wbof',
#   'Ovyy Tngrf',
#   'Gvz Orearef-Yrr',
#   'Fgrir Jbmavnx',
#   'Xbaenq Mhfr',
#   'Fve Nagbal Ubner',
#   'Zneiva Zvafxl',
#   'Lhxvuveb Zngfhzbgb',
#   'Unllvz Fybavzfxv',
#   'Tregehqr Oynapu'
# ].freeze

# def decode(name)
#   arr1 = ("a".."m").to_a
#   arr2 = ('n'..'z').to_a

#   split_name = name.split

#   split_name.map do |word|

#     word.chars.map do |char|
#         char.downcase!

#         if arr1.include?(char)
#           arr2[arr1.index(char)]

#         elsif arr2.include?(char)
#           arr1[arr2.index(char)]

#         else
#           char
#         end


#     end.join.capitalize
#   end.join(" ")
# end

# ENCRYPTED_PIONEERS.each do |pioneer|

#   puts decode(pioneer)
# end
# #Nqryr Tbyqfgvar





# # 6


# def any?(collection)
#   counter = 0

#   while counter < collection.size

#     return true if yield(collection[counter])

#     counter += 1
#   end
#   false

# # if any of the elements within arr is true, then return true
# end

# p any?([1, 3, 5, 6]) { |value| value.even? } == true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false





# 7


# def all?(collection)

#    collection.each {|item| return false unless yield(item)}
#    true
# end

# p all?([1, 3, 5, 6]) { |value| value.odd? } == false
# p all?([1, 3, 5, 7]) { |value| value.odd? } == true
# p all?([2, 4, 6, 8]) { |value| value.even? } == true
# p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p all?([1, 3, 5, 7]) { |value| true } == true
# p all?([1, 3, 5, 7]) { |value| false } == false
# p all?([]) { |value| false } == true





# 8

# def none?(collection)

#    collection.each {|item| return false if yield(item)}
#    true
# end

# p none?([1, 3, 5, 6]) { |value| value.even? } == false
# p none?([1, 3, 5, 7]) { |value| value.even? } == true
# p none?([2, 4, 6, 8]) { |value| value.odd? } == true
# p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p none?([1, 3, 5, 7]) { |value| true } == false
# p none?([1, 3, 5, 7]) { |value| false } == true
# p none?([]) { |value| true } == true



# 9

# def one?(collection)

#   collection.select {|item| yield(item) }.size == 1

# end

# p one?([1, 3, 5, 6]) { |value| value.even? }    == true
# p one?([1, 3, 5, 7]) { |value| value.odd? }     == false
# p one?([2, 4, 6, 8]) { |value| value.even? }    == false
# p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p one?([1, 3, 5, 7]) { |value| true }           == false
# p one?([1, 3, 5, 7]) { |value| false }          == false
# p one?([]) { |value| true }                     == false






# 10

# Write a method that takes an array as an argument,
# and a block that returns true or false depending on the value
# of the array element passed to it.
# The method should return a count of the number of times the block returns true.

# You may not use Array#count or Enumerable#count in your solution.

# Examples:

def count(collection)
  counter =  0

  collection.each {|item| counter += 1 if yield(item)}
  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2