FactoryBot.define do
  factory :task, class: 'Task' do
    name { 'test' }
    description { 'some text' }
    due_date { Date.today }
  end
end
