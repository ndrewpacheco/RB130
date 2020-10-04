# ## 1

# The Range#step method lets you iterate over a range of values
#where each value in the iteration is the previous value plus a "step" value.
# It returns the original range.

# Write a method that does the same thing as Range#step,
#but does not operate on a range.

#Instead, your method should take 3 arguments:
# the starting value, the ending value, and the step value to be applied
# to each iteration.
#Your method should also take a block to which it will
#yield (or call) successive iteration values.

# def step(start, stop, step)

#   val = start

#   loop do
#     yield(val)
#     break if val + step > stop
#     val += step
#   end
#   val
# end

# step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10
# What do you think would be a good return value for this method, and why?








# 2

# def zip(arr1, arr2)
#   result = []
#   arr_size = arr1.size

#   arr_size.times do |n|
#     result << [arr1[n], arr2[n]]
#   end
#   result
# # returns new array with both elements zipped in
# end
# p zip([1, 2, 3], [4, 5, 6]) #== [[1, 4], [2, 5], [3, 6]]





### 3

# def map(arr)
#   result = []
#   arr.each {|item| result << yield(item)}
#   result
# end

# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]




# 4

# def count(*args)
#   count = 0
#   args.each {|item| count += 1 if yield(item)}
#   count
# end

# p count(1, 3, 6) { |value| value.odd? } == 2
# p count(1, 3, 6) { |value| value.even? } == 1
# p count(1, 3, 6) { |value| value > 6 } == 0
# p count(1, 3, 6) { |value| true } == 3
# p count() { |value| true } == 0
# p count(1, 3, 6) { |value| value - 6 } == 3








# 5

# Write a method called drop_while that behaves similarly for Arrays.
# It should take an Array as an argument, and a block.
# It should return all the elements of the Array,
#except those elements at the beginning
#of the Array that produce a truthy value when passed to the block.

#If the Array is empty,
#or if the block returns a truthy value for every element,
#drop_while should return an empty Array.


#Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until
# to iterate through the Array passed in as an argument,
#
# def drop_while(arr)
#   result = []
#   last_idx = arr.index(arr.last)

#   arr.each_with_index do |item, idx|
#     if idx == last_idx
#       result << item
#     else
#       if !yield(item)
#         result << item
#       end
#     end
#   end
#   result
# end

# p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } #== [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| true } == []
# p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# p drop_while([]) { |value| true } == []





#### 6
# def each_with_index(arr)

#   idx = 0

#   loop do
#     break if idx == arr.size
#     yield(arr[idx], idx)
#     idx += 1
#   end

#   arr
# end

# result = each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end

# puts result == [1, 3, 6]

# 0 -> 1
# 1 -> 3
# 2 -> 36
# true









### 7
# The Enumerable#each_with_object method iterates over the members of a collection,
# passing each element and an arbitrary object (usually a collection)
# to the associated block.

#The value returned by the block is not used.

# The object that is passed to the block is defined as an argument to each_with_object;
# with each iteration, this object may be updated by the block.
# When iteration is complete, the final value of the object is returned.

# Write a method called each_with_object that behaves similarly for Arrays.
# It should take an Array and an object of some sort as an argument, and a block.
# It should yield each element and the object to the block.
# each_with_object should return the final value of the object.

# If the Array is empty,
# # each_with_object should return the original object passed as its second argument.

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




## 8

# Write a method called max_by that behaves similarly for Arrays.
# It should take an Array and a block,
# and return the element that contains the largest value.

# If the Array is empty, max_by should return nil.

# Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

# Examples:

# # Copy Code
# def max_by(arr)
#   largest_idx = 0
# # iterate through each item, if the current item yields larger, set that idx to largest
#   arr.each_with_index do |item, idx|
#     largest_idx = idx if yield(item) > yield(arr[largest_idx])
#   end
#   arr[largest_idx]
# end

# p max_by([1, 5, 3]) { |value| value + 2 } == 5
# p max_by([1, 5, 3]) { |value| 9 - value } == 1
# p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# p max_by([-7]) { |value| value * 3 } == -7
# p max_by([]) { |value| value + 5 } == nil


## 9

# The Enumerable#each_cons method iterates over the members of a collection
# taking each sequence of n consecutive elements at a time
# and passing them to the associated block for processing.
#It then returns a value of nil.

# Write a method called each_cons that behaves similarly for Arrays,
# taking the elements 2 at a time.

# The method should take an Array as an argument, and a block.
# It should yield each consecutive pair of elements to the block, and return nil.

def each_cons(arr, amount)

  # if amount is 1,
  if amount == 1
    arr.each {|item| yield(item) }
  elsif amount == 2
    arr.each_with_index do |item, idx|
      yield(arr[idx - 1], item ) unless idx == 0
    end
  else

    # start at idx 0,  slice accoruding to amount
    counter = 0
    loop do
      amount_arr = arr[counter, amount]
      break if amount_arr.size != amount
      first_val = amount_arr.delete_at(0)
      yield(first_val, *amount_arr)
      counter += 1
    end


  end
  nil
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