# spec/graphql/mutations/update_note_mutation_spec.rb

require 'rails_helper'

RSpec.describe Mutations::UpdateNote, type: :request do
  describe 'updateNote mutation' do
    let!(:note) { create(:note) }
    let(:name) { 'Updated Note Name' }
    let(:content) { 'Updated Note Content' }

    it 'updates an existing note' do
      post '/graphql', params: { query: update_note_mutation_query(note.id, name, content) }

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

  def update_note_mutation_query(id, name, content)
    <<~GQL
      mutation {
        updateNote(input: { id: "#{id}", name: "#{name}", content: "#{content}" }) {
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
