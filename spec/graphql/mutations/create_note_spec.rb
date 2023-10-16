# spec/graphql/mutations/create_note_mutation_spec.rb

require 'rails_helper'

RSpec.describe Mutations::CreateNote, type: :request do
  describe 'createNote' do
    let(:name) { 'Test Note' }
    let(:content) { 'This is a test note.' }

    it 'creates a new note' do
      post '/graphql', params: { query: <<~GRAPHQL
        mutation {
          createNote(input: { name: "#{name}", content: "#{content}" }) {
            note {
              id
              name
              content
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
