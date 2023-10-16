# frozen_string_literal: true

# app/graphql/mutations/update_task.rb
module Mutations
  class DestroyTask < Mutations::BaseMutation
    argument :id, ID, required: true

    field :task, Types::TaskType, null: true
    field :errors, [String], null: false

    def resolve(id:)
      task = Task.find(id)
      if task.destroy
        { task:, errors: [] }
      else
        { task: nil, errors: task.errors.full_messages }
      end
    end
  end
end
