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
  attr_accessor :title, :todos, :result

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(item)

    validate_todo_obj(item)

    todos << item
  end

   alias_method :<<, :add

  def validate_todo_obj(todo_obj)
    raise TypeError.new("Can only add Todo objects") unless todo_obj.class == Todo
  end

  def select
    select_list = TodoList.new(title)

    each do |item|

    select_list.add(item) if yield(item)
    end

    select_list
  end

  def each
    counter = 0

    while counter < todos.size
      yield(todos[counter])
      counter += 1
    end

    self
  end

   def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all? {|item| item.done? }
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    todos.each {|item| item.done!}
  end

  def remove_at(idx)
    todos.delete(item_at(idx))
  end

  def pop
    todos.pop
  end

  def shift
    todos.shift
  end

  def find_by_title(search_title)
    #takes a string as argument,
    # and returns the first Todo object that matches the argument.
    #Return nil if no todo is found.
    result = nil

    selected_todos = todos.select {|todo| todo.title == search_title }
    result = selected_todos.first unless selected_todos.empty?
    #either returns nil or  Todo Obj
    result
  end

  def all_done
    # returns new TodoList object containing only the done items
    select {|item| item.done?}
  end

  def all_not_done
    select {|item| !item.done?}
  end

  def mark_done(str)
    #takes a string as argument, and marks the first Todo object
    #that matches the argument as done.
    find_by_title(str).done!
  end

  def mark_all_done
    each {|item| item.done!}
  end

  def mark_all_undone

    each {|item| item.undone!}

  end

end

