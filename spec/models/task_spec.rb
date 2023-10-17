# spec/models/task_spec.rb
require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:name) { "John Doe" }
  let(:email) { "johndoe@example.com" }

  it { should validate_presence_of(:name) }

  it 'is valid with a name and belongs to a user' do
    user = User.create(name: name, email: email)
    task = Task.new(name: 'Test Task', user: user)
    expect(task).to be_valid
  end

  it 'is invalid without a name' do
    user = User.create(name: name, email: email)
    task = Task.new(name: nil, user: user)
    expect(task).to be_invalid
  end

end
