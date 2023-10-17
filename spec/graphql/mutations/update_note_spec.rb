# frozen_string_literal: true

# spec/graphql/mutations/update_note_mutation_spec.rb

require 'rails_helper'

RSpec.describe Mutations::UpdateNote, type: :request do
  describe 'updateNote mutation' do
    let(:user) { User.create(name: 'user_one', email: 'user@example.com') }
    let(:note) { Note.create(name: 'test', content: 'test', user_id: user.id) }
    let(:name) { 'Updated Note Name' }
    let(:content) { 'Updated Note Content' }

    it 'updates an existing note' do
      post '/graphql', params: { query: update_note_mutation_query(note.id, name, content, user.id) }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      data = json['data']['updateNote']

      expect(data['note']).not_to be_nil
      expect(data['note']['id']).to eq(note.id.to_s)
      expect(data['note']['name']).to eq(name)
      expect(data['note']['content']).to eq(content)
      expect(data['errors']).to be_empty
    end
  end

  def update_note_mutation_query(id, name, content, _userId)
    <<~GQL
      mutation {
        updateNote(input: { id: "#{id}", name: "#{name}", content: "#{content}", userId: #{user.id} }) {
          note {
            id
            name
            content
          }
          errors
        }
      }
    GQL
  end
end
