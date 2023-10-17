require 'rails_helper'

RSpec.describe Mutations::DestroyNote, type: :request do
  describe 'sdsdf' do
    let(:user) { User.create(name: "user_one", email: "user@example.com") }
    let(:note) { Note.create(name: "test", content: "test", user_id: user.id) }
    let(:name) { 'Test Note' }

    it 'destroy note' do
      post '/graphql', params: { query: <<~GRAPHQL
        {
          note(id: #{note.id}){
            name
            content
          }
        }
      GRAPHQL
      }

      expect(response).to have_http_status(:success)
    end
  end
end
