5.times do
  Note.create(name: Faker::Name.name, content: Faker::Lorem.paragraphs)
end

5.times do
  Task.create(name: Faker::Name.name, description: Faker::Lorem.paragraphs, due_date: Faker::Date.between(from: 2.days.ago, to: Date.today))
end