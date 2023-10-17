# frozen_string_literal: true

module Mutations
  class CreateTask < Mutations::BaseMutation
    argument :name, String, required: true
    argument :description, String, required: true
    argument :user_id, ID, required: true

    field :task, Types::TaskType, null: true
    field :errors, [String], null: false

    def resolve(name:, description:, user_id:)
      user = User.find(user_id)
      task = user.tasks.new(name:, description:)
      if task.save
        { task:, errors: [] }
      else
        { task: nil, errors: task.errors.full_messages }
      end
    end
  end
end
