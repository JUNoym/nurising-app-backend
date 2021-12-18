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

SAMPLE_USERS = [
    {
      name: '磯村',
    },
    {
      name: '森古'
    },
    {
      name: '浅田文男',
    }
  ]
  
  SAMPLE_USERS.each do |user|
    User.create(user)
  end

  SAMPLE_ACTIONS = [
    {
      name: '排便',
    },
    {
      name: '排尿'
    },
    {
      name: 'パッド交換',
    },
    {
      name: '失禁',
    }
  ]

  SAMPLE_ACTIONS.each do |action|
    CareAction.create(action)
  end