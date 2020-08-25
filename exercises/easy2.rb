# 1

# def step(n1, n2, step_seq)
#   range = (n1..n2)
#   counter = n1
#   while counter <= n2
#     yield(counter)
#     counter += step_seq
#   end
#   n1
# end

# p step(1, 10, 3) { |value| puts "value = #{value}" }


# value = 1
# value = 4
# value = 7
# value = 10





# 2

# def zip(arr1, arr2)
#   result = []

#   arr1.size.times do |n|
#     result << [arr1[n], arr2[n]]
#   end
#   result
# end

# p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]





# 3

# def map(arr)
#   result = []

#   arr.each do |item|
#     result << yield(item)
#   end
#   result
# end

# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]




# # 4
# def count(*args)
#   counter = 0
#   args.each { |n| counter += 1 if yield(n) }
#   counter
# end

# p count(1, 3, 6) { |value| value.odd? } == 2
# p count(1, 3, 6) { |value| value.even? } == 1
# p count(1, 3, 6) { |value| value > 6 } == 0
# p count(1, 3, 6) { |value| true } == 3
# p count() { |value| true } == 0
# p count(1, 3, 6) { |value| value - 6 } == 3



# 5

# The Enumerable#drop_while method begins by iterating over
# the members of a collection,

#  passing each element to the associated block
#  until it finds an element for which the block returns false or nil.
# It then converts the remaining elements of the collection
# (including the element that resulted in a falsey return) to an Array,
# and returns the result.

# def drop_while(arr)
#   # until it finds an element for which the block returns false or nil.
#   counter = 0
#   loop do

#     break if yield(arr[counter]) == false || counter >= arr.size

#     counter += 1
#   end

#   arr[counter..-1]

# end
# p drop_while([1, 3, 5, 6]) { |value| value.odd? }   == [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? }  == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| true }         == []
# p drop_while([1, 3, 5, 6]) { |value| false }        == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| value < 5 }    == [5, 6]
# p drop_while([]) { |value| true }                   == []

# 6

# def each_with_index(arr)

#   idx = 0
#   arr.each do |item|
#     yield(item, idx)
#     idx += 1
#   end
# end

# result = each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end

# puts result == [1, 3, 6]
# # should output:

# # 0 -> 1
# # 1 -> 3
# # 2 -> 36
# # true


# 7

# def each_with_object(arr, obj)

#   arr.each do |item|

#     yield(item, obj)
#   end
#   obj
# end

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# p result == [1, 9, 25]

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# p result == { 1 => 1, 3 => 9, 5 => 25 }

# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# p result == {}



# 8
# The Enumerable#max_by method iterates over the members of a collection,
# passing each element to the associated block.

#It then returns the element for which the block returned the largest value.

# Write a method called max_by that behaves similarly for Arrays.
#It should take an Array and a block,
#and return the element that contains the largest value.

# If the Array is empty, max_by should return nil.

# def max_by(arr)

#   hsh = {}
#   arr.each do |item|
#     hsh[yield(item)] = item

#   end

#    hsh[hsh.keys.max]
#   # return item with largest value
# end

# p max_by([1, 5, 3]) { |value| value + 2 } == 5
# p max_by([1, 5, 3]) { |value| 9 - value } == 1
# p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# p max_by([-7]) { |value| value * 3 } == -7
# p max_by([]) { |value| value + 5 } == nil




# 9

# The Enumerable#each_cons method iterates over the members of a collection
# taking each sequence of n consecutive elements at a time
#and passing them to the associated block for processing.

#It then returns a value of nil.

# Write a method called each_cons that behaves similarly for Arrays,
#taking the elements 2 at a time.
# The method should take an Array as an argument, and a block.
# It should yield each consecutive pair of elements to the block, and return nil.
# def each_cons(arr)
#   counter = 1

#   while counter < arr.size do

#     yield(arr[counter - 1], arr[counter])
#     counter += 1
#   end

# end

# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end
# p result == nil
# p hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# result = each_cons([]) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {}
# p result == nil

# hash = {}
# result = each_cons(['a', 'b']) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {'a' => 'b'}
# p result == nil








# 10

def each_cons(arr, amount)

  arr.each_with_index do |item, idx|

      values = arr.slice(idx, amount)
      yield(item, *values[1..-1]) if values.size == amount
    end
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}
