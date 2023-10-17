# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::DestroyTask, type: :request do
  describe 'Destroy "Task"' do
    let(:user) { User.create(name: 'user_one', email: 'user@example.com') }
    let(:task) { Task.create(name: 'test', description: 'test', user_id: user.id) }
    let(:name) { 'Test Note' }

    it 'creates task' do
      post '/graphql', params: { query: <<~GRAPHQL
        {
          note(id: #{task.id}){
            name
            description
          }
        }
      GRAPHQL
      }

      expect(response).to have_http_status(:success)
    end
  end
end
