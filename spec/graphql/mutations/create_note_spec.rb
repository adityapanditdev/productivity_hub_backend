# frozen_string_literal: true

# spec/graphql/mutations/create_note_mutation_spec.rb

require 'rails_helper'

RSpec.describe Mutations::CreateNote, type: :request do
  describe 'createNote' do
    let(:user) { User.create(name: "user_one", email: "user@example.com") }
    let(:name) { 'Test Note' }
    let(:content) { 'This is a test note.' }

    it 'creates a new note' do
      post '/graphql', params: { query: <<~GRAPHQL
        mutation {
          createNote(input: { name: "#{name}", content: "#{content}", userId: #{user.id} }) {
            note {
              id
              name
              content
              user{
                id
                name
              }
            }
            errors
          }
        }
      GRAPHQL
      }

      json_response = JSON.parse(response.body)

      expect(json_response['data']['createNote']['note']['name']).to eq(name)
      expect(json_response['data']['createNote']['note']['content']).to eq(content)
      expect(json_response['data']['createNote']['errors']).to be_empty
    end
  end
end
