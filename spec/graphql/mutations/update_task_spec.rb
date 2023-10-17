# frozen_string_literal: true

# spec/graphql/mutations/update_task_mutation_spec.rb

require 'rails_helper'

RSpec.describe Mutations::UpdateTask, type: :request do
  describe 'updateTask mutation' do
    let(:user) { User.create(name: 'user_one', email: 'user@example.com') }
    let(:task) { Task.create(name: 'test', description: 'test', user_id: user.id) }
    let(:name) { 'Updated Task Name' }
    let(:description) { 'Updated Task Description' }

    it 'updates an existing task' do
      post '/graphql', params: { query: update_task_mutation_query(task.id, name, description, user.id) }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      data = json['data']['updateTask']

      expect(data['task']).not_to be_nil
      expect(data['task']['id']).to eq(task.id.to_s)
      expect(data['task']['name']).to eq(name)
      expect(data['task']['description']).to eq(description)
      expect(data['errors']).to be_empty
    end
  end

  def update_task_mutation_query(id, name, description, _userId)
    <<~GQL
      mutation {
        updateTask(input: { id: "#{id}", name: "#{name}", description: "#{description}", userId: #{user.id} }) {
          task {
            id
            name
            description
          }
          errors
        }
      }
    GQL
  end
end
