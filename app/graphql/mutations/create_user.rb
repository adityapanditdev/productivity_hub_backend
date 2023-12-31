# frozen_string_literal: true

module Mutations
  class CreateUser < Mutations::BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(name:, email:)
      user = User.new(name:, email:)
      if user.save
        { user:, errors: [] }
      else
        { user: nil, errors: task.errors.full_messages }
      end
    end
  end
end
