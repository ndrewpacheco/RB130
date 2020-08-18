

# [1, 2, 3].reduce(10) do |acc, num|
#   acc + num
# end

# => 16

# Try to write a reduce method on your own that exhibits this behavior.
#Your reduce should take at least 1 argument that represents the array
#we'll operate on.

# It should also take an optional second argument
#that represents the default value for the accumulator.
# Here's a few examples that we should be able to call on your method.

array = [1, 2, 3, 4, 5]

def reduce(arr, acc = 0)
    first_ele = arr[0]

    acc = first_ele.class.new unless first_ele.is_a? Integer
    arr.each do |n|

      acc = yield(acc, n)
    end
    acc


end

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
#reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']