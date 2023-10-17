# frozen_string_literal: true

module Mutations
  class UpdateTask < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :description, String, required: false
    argument :user_id, ID, required: true

    field :task, Types::TaskType, null: true
    field :errors, [String], null: false

    def resolve(id:, name:, description:, user_id:)
      task = Task.find(id)
      if task.update(name:, description:, user_id:)
        { task:, errors: [] }
      else
        { task: nil, errors: task.errors.full_messages }
      end
    end
  end
end
