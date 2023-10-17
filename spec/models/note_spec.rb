# spec/models/note_spec.rb
require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:name) { "John Doe" }
  let(:email) { "johndoe@example.com" }

  it { should validate_presence_of(:name) }

  it 'is valid with a name and belongs to a user' do
    user = User.create(name: name, email: email)
    note = Note.new(name: 'Test Note', user: user)
    expect(note).to be_valid
  end

  it 'is invalid without a name' do
    user = User.create(name: name, email: email)
    note = Note.new(name: nil, user: user)
    expect(note).to be_invalid
  end
end
