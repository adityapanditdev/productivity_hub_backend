# frozen_string_literal: true

module Mutations
  class CreateNote < Mutations::BaseMutation
    argument :name, String, required: true
    argument :content, String, required: true
    argument :userId, ID, required: true

    field :note, Types::NoteType, null: true
    field :errors, [String], null: false

    def resolve(name:, content:, userId:)
      user = User.find(userId)
      note = user.notes.new(name:, content:)
      if note.save
        { note:, errors: [] }
      else
        { note: nil, errors: note.errors.full_messages }
      end
    end
  end
end
