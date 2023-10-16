# frozen_string_literal: true

# app/graphql/mutations/update_task.rb
module Mutations
  class UpdateTask < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :description, String, required: false

    field :task, Types::TaskType, null: true
    field :errors, [String], null: false

    def resolve(id:, name:, description:)
      task = Task.find(id)
      if task.update(name:, description:)
        { task:, errors: [] }
      else
        { task: nil, errors: task.errors.full_messages }
      end
    end
  end
end
