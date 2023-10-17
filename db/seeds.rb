# frozen_string_literal: true
# Create Users
user1 = User.create(name: 'User 1', email: 'user1@example.com')
user2 = User.create(name: 'User 2', email: 'user2@example.com')

# Create Notes for User 1
5.times do
  user1.notes.create(name: Faker::Name.name, content: Faker::Lorem.paragraphs)
end

# Create Notes for User 2
5.times do
  user2.notes.create(name: Faker::Name.name, content: Faker::Lorem.paragraphs)
end

# Create Tasks for User 1
5.times do
  user1.tasks.create(
    name: Faker::Name.name,
    description: Faker::Lorem.paragraphs,
    due_date: Faker::Date.between(from: 2.days.ago, to: Date.today)
  )
end

# Create Tasks for User 2
5.times do
  user2.tasks.create(
    name: Faker::Name.name,
    description: Faker::Lorem.paragraphs,
    due_date: Faker::Date.between(from: 2.days.ago, to: Date.today)
  )
end

