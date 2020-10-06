require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    @list.done!
    assert(@list.done?)
  end

  def test_error_on_adding_todo
    assert_raises(TypeError) do
      @list.add("string")
    end
  end

  def test_add
    @todo4 = Todo.new("Do test")
    @list.add(@todo4)
    assert_equal(@todo4, @list.last)
  end

  def test_add_alias
    @todo4 = Todo.new("Do test")
    @list << (@todo4)
    assert_equal(@todo4, @list.last)
  end

  def test_item_at
    assert_raises(IndexError){ @list.item_at(400)}
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError){ @list.mark_done_at(400)}
    @list.mark_done_at(0)
    assert @todo1.done?
    refute @todo2.done?
    refute @todo3.done?
  end

  def test_mark_undone_at
    assert_raises(IndexError){ @list.mark_undone_at(400)}
    @list.done!
    @list.mark_undone_at(0)
    refute @todo1.done?
    assert @todo2.done?
    assert @todo3.done?
  end

  def test_done!
    @list.done!
    assert @todo1.done?
    assert @todo2.done?
    assert @todo3.done?
  end

  def test_remove_at
#Hint: this method raises IndexError if argument does not return item.
    assert_raises(IndexError){@list.remove_at(400)}
    assert_equal(@todo1, @list.remove_at(0))
    assert_equal([@todo2, @todo3], @list.to_a)
  end


  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    @todo1.done!
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    test_collection = []
    @list.each {|todo| test_collection << todo }

    assert_equal(test_collection, @list.to_a)
  end


end
