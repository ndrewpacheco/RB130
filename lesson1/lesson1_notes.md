### study guide points:
- Blocks
- Closures and scope
- How blocks work, and when we want to use them.
- Blocks and variable scope
- Write methods that use blocks and procs
- Methods with an explicit block parameter
- Arguments and return values with blocks
- When can you pass a block to a method
- `&:symbol`


---

### Closures
a closure is a general computing concept and refers to a "chunk of code" that a programmer can execute at a later time. This chunk of code can refer to is surrounding context, also known as its binding. 

There are three ways in which closures are used in Ruby:
With procs, lambdas, and blocks. 

```ruby
[1, 2, 3].each do |num|
  puts num
end
```
the code above can be broken up into 3 parts. 

The calling object, which is the array.

The method invocation, which in this case is the `each` method

Then the block which is an argument to the method.


--
### Blocks

Every method in Ruby is able to take in an optional block.

When a block is passed into a method, a few things can happen depending on how the method is implemented. The method can use the block to manipulate its own return value. The method can also  completely ignore the block. How a method reacts to a block is dependent on the method's implementation. 


### yield
We can use the 	`yield` keyword within the method implementation. This keyword will allow us to execute the block from within the method. 

### Local jump error

This error happens when there is no block that is being passed to the method during invocation, yet the method implementation makes use of the `yield` keyword. 

in order to avoid this, we can use the method `block_given?` which is returns true if a block was passed during method invocation.

### Yielding with an argument














