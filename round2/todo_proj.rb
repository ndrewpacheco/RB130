# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects" if todo.class != Todo
    @todos << todo
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.to_a
  end

  def done?
  # returns true if all todos in the list are done, otherwise false
    @todos.all? { |todo| todo.done }
  end

  def item_at(idx = nil)
    raise ArgumentError, "wrong number of arguments" if idx.nil?
    raise IndexError, "not an index" if idx > size

    @todos[idx]
  end

  def mark_done_at(idx = nil)
    raise ArgumentError, "wnua" if idx.nil?
    raise IndexError, "not an index" if idx > size

    @todos[idx].done!
  end

  def mark_undone_at(idx)
    raise ArgumentError, "wrong number of arguments" if idx.nil?
    raise IndexError, "not an index" if idx > size

    @todos[idx].undone!
  end

  def done!

  end

  def shift

  end

  def pop

  end

  def remove_at(idx)

  end

  def each
    @todos.each do |todo|

      yield(todo)
    end
    self
  end

  def select
    result = TodoList.new(title)
    each do |todo|
      result.add(todo) if yield(todo)
    end
    result.class
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
end
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect