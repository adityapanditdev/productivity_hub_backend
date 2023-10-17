# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::CreateTask, type: :request do
  describe 'createTask' do
    let(:user) { User.create(name: "user_one", email: "user@example.com") }
    let(:name) { 'test' }
    let(:description) { 'some text.' }

    it 'creates a new task' do
      post '/graphql', params: { query: <<~GRAPHQL
        mutation {
          createTask(input: { name: "#{name}", description: "#{description}", userId: #{user.id} }) {
            task {
              id
              name
              description
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
      expect(json_response['data']['createTask']['task']['name']).to eq(name)
      expect(json_response['data']['createTask']['task']['description']).to eq(description)
      expect(json_response['data']['createTask']['errors']).to be_empty
    end
  end
end
