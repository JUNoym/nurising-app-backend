SAMPLE_TODOS = [
    {
      name: 'Python勉強',
    },
    {
      name: 'JS勉強'
    },
    {
      name: 'Ruby勉強',
    }
  ]
  
  SAMPLE_TODOS.each do |todo|
    Todo.create(todo)
  end