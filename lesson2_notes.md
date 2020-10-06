## lesson 2 notes

### Minitest vs. RSpec

Minitest is the default testing library for Ruby. It can do everything RSpec can. Minitest uses straightforward Ruby. Rspec is a DSL, a domain specific language. 


### Test Suite

The entire collection of tests within a project


### Test

A description of a particular context that a test may be run. Ex: Raising an error because of the wrong input. A test can have many assertions.


### Assertion

The actual step in examining if data being returned from the application produces the desired result. There can be one or more assertions in a test. 

### test_

This is a naming convention that lets Minitest know individual tests need to be run.

### assert_equal

This is a type of assertion. It is a method that takes two parameters, expected value, and actual value

 `assert_equal(expected_value, actual_value)`
 
 If there is an error, Minitest will report it at the end of a test run. 

### Expectation Syntax

Some people use expectation syntax to follow Rspec, but Launch School will follow the assertion style as it is better for beginner ruby developers. 

## SEAT Approach

In larger projects, there are usually 4 steps to writing a test:

- Set up the necessary objects.
- Execute the code against the object we're testing.
- Assert the results of the execution.
- Tear down and clean up any lingering artifacts.


### `setup`

The `setup` is an instance method and will be run before every test. We can use `setup` to get rid of redundant code that gets used multiple times. 

```ruby
class AthleteTest < MiniTest::Test
  def setup
    @athlete = Athlete.new
  end

  def athlete_exists
    assert(@athlete)
  end
end
```

### Testing Equality

`assert_equal` tests for value equality. This can be seen as `obj1 == obj2`

`assert_same` tests for object equality. 

`obj1.eql?(obj2)`


If we create our own custom classes, we must define a `==` method in order to run assertions like `assert_equal` properly. 
