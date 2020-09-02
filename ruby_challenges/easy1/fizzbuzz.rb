# "Write a program that prints the numbers from 1 to 100.

#But for multiples of three print “Fizz” instead of the number
# and for the multiples of five print “Buzz”.
#For numbers which are multiples of both three and five print “FizzBuzz”."
# Source: "Using FizzBuzz to Find Develop

def fizzbuzz

  numbers = (1..100).to_a

  numbers.map do |number|
    if number % 3 == 0 && number % 5 == 0
      "FizzBuzz"
    elsif number % 3 == 0
      "Fizz"
    elsif number % 5 == 0
      "Buzz"
    else
      number
    end
  end
end

puts fizzbuzz