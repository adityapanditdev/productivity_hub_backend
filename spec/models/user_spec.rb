# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:name) { "John Doe" }
  let(:email) { "johndoe@example.com" }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }

  it 'is valid with a name and email' do
    user = User.new(name: name, email: email)
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(name: nil, email: email)
    expect(user).to be_invalid
  end

  it 'is invalid without an email' do
    user = User.new(name: name, email: nil)
    expect(user).to be_invalid
  end

  it 'has many notes' do
    user = User.create(name: name, email: email)
    note = Note.create(name: 'Test Note', user: user)
    expect(user.notes).to include(note)
  end

  it 'has many tasks' do
    user = User.create(name: name, email: email)
    task = Task.create(name: 'Test Task', user: user)
    expect(user.tasks).to include(task)
  end
end
