require 'rails_helper'

RSpec.describe Mutations::CreateTask, type: :request do
  describe 'createTask' do
    let(:name) { 'Test' }
    let(:description) { 'some text.' }

    it 'creates a new task' do
      post '/graphql', params: { query: <<~GRAPHQL
        mutation {
          createTask(input: { name: "#{name}", description: "#{description}" }) {
            task {
              id
              name
              description
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
