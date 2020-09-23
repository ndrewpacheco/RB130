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

```ruby
3.times do |num|
  puts num
end
```
The `num` variable in between the two `|` is known as a block parameter, and within the block, `num` is referred to as a block local variable.

It is important that the block parameter has a unique name, in order to not cause any variable shadowing to happen. 

Tracing some code line by line:

```ruby
# method implementation
def increment(number)
  if block_given?
    yield(number + 1)
  end
  number + 1
end

# method invocation
increment(5) do |num|
  puts num
end
```

1. the `increment` method is invoked on line 10
2. We then proceed to the method implementation on line 2, where the `number` argument is assigned to Integer `5`. The block is readily available
3. Line 3 brings us to a conditional, invoking the `block_given?` method. The conditional returns true as we do have a block available. 
4. Since the conditional returns true, execution is yielded to a block. We pass in `number + 1` to the block.
5. We then proceed to line 10 for the execution of the block. the block local `num` is assigned to `number + 1`


yada yada

#### wrong number of arguments ?

If we pass in more arguments than needed, ruby will simply ignore the extra arguments. 

if we pass less arguments than needed, those block variables that do not get assigned will be `nil`. 

This concept is known as arity. Blocks have laid back rules when it comes arity. 

Main idea: Blocks don't enforce argument count, unlike methods in Ruby. 

### Return value of yielding to the block

Blocks and methods share a similar behavior. They both have a return value, which is found in the last expression in either the block or method. Therefore, just like methods, blocks can mutate an argument or just return a value. 

### When to use blocks in your own methods

Two main reasons to use blocks with methods:

1. defer implementation code to a method invocation decision.


	When a method implementation is used generically, it allows for more refinement when using a block with a method. 

 
2. Methods that need to perform sandwich code, aka before and after actions.  

 Sandwich code is a good example of the first point. It is useful for actions such as logging, timing and notification systems. 
 
 We can use blocks to specify a particular action, but have the implementation execute code before and after the block to do things such as log or time things. 
 
 Another use of sandwich code is resource management. Many OS's require a developer to first find a resource, and then "clean up" to free up that resource. This can be shown with the `File::open` method 
 
 ```ruby
 andrew_file = File.open("andrew_file.txt", "w+")
# write to file using write method
andrew_file.close 
```

The last line above closes the file and lets go of system resources. 


 ```ruby
 andrew_file = File.open("andrew_file.txt", "w+") do |file|
  		# write to file using write method
  		end
 ```
  	
 In the above example, the method implementation opens the file, yields to a block and then closes the file. There is no need to close the file ourselves. 
 
### Methods with an explicit block parameter


The `&` symbol, when preceding a block argument, converts that block argument to a simple `Proc` object. We let go of the `&` when we refer to the parameter within the method. 

```ruby
def some_method(&block_arg)
  puts "What's &block_arg? #{block_arg}"
end
```

Explicit blocks give us extra flexibility. Working with an implicit block is 2 dimensional in the sense of all we can do with the block is yield it. Now we can pass the block to other methods, as we now have a handle for it.

```ruby
def test2(block)
  puts "hello"
  block.call                    # calls the block that was originally passed to test()
  puts "good-bye"
end

def test(&block)
  puts "1"
  test2(block)
  puts "2"
end

test { puts "xyz" }
# => 1
# => hello
# => xyz
# => good-bye
# => 2
```	


We only need to use 	`&` in `test` and not `test2` because it is already a `Proc` in `test2`. No conversion is needed. 

## Summary

- Blocks are a way Ruby implements closures. Closures are "chunks of code" that can be executed later. 
- Blocks can take arguments, but they will not raise errors if the wrong number of arguments are passed in.
- Blocks have a return value. 
-  We can use blocks to defer implementation details at invocation. We can build generic methods which use blocks for finer details. 
-  Blocks are good for "sandwich" code.


## Blocks and Variable Scope

In order for a closure aka "chunk of code" to be executed at a later time, the closure must be aware of its surrounding environment when it is initialized. 

```ruby
sport = "baseball"
chunk = Proc.new {puts "I play #{name}"}
```
Running the above code would do nothing because even though we've initialized the new local variable, `chunk`, we have not executed it yet.


A `Proc` keeps track of its surrounding context. It brings it where ever the chunk of code gets passed. This is known as its binding. The chunk keeps track of all its variables, methods, constants, anything that is needed for it to execute properly. 



## Symbol to proc

When we prepend a `&` to an object, Ruby first checks if that object is a `Proc`. If it is a `Proc`, Ruby uses it as is. 

If it is not a `Proc`, Ruby calls `#to_proc` on the object. This should return a `Proc` object. An error will happen if the `#to_proc` method does not return a `Proc` object.

If everything works, the `Proc` is converted into a block via the `&`. 

## Lesson 1 Summary (from text):

- blocks are just one way Ruby implements closures. Procs and lambdas are others.
- closures drag their surrounding context/environment around, and this is at the core of how variable scope works.
blocks are great for pushing some decisions to method invocation time.
- blocks are great for wrapping logic, where you need to perform some before/after actions.
we can write our own methods that take a block with the yield keyword.
- when we yield, we can also pass arguments to the block.
- when we yield, we have to be aware of the block's return value.
- once we understand blocks, we can re-implement many of the common methods in the Ruby core library in our own classes.
- the Symbol#to_proc is a nice shortcut when working with collections.
 
