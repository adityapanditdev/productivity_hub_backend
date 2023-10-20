# frozen_string_literal: true

# Create Users
user1 = User.create(name: 'User 1', email: 'user1@example.com')
user2 = User.create(name: 'User 2', email: 'user2@example.com')

# Create Notes for User 1
5.times do
  user1.notes.create(name: 'user note 1', content: 'user note 1 content')
end

# Create Notes for User 2
5.times do
  user2.notes.create(name: 'user note 2', content: 'user note 2 content')
end

# Create Tasks for User 1
5.times do
  user1.tasks.create(
    name: 'user-task-1',
    description: 'user-task-description-1',
    due_date: Date.today
  )
end

# Create Tasks for User 2
5.times do
  user2.tasks.create(
    name: 'user-task-2',
    description: 'user-task-description-2',
    due_date: Date.today
  )
end
