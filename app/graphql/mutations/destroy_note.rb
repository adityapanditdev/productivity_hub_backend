# frozen_string_literal: true

module Mutations
  class DestroyNote < Mutations::BaseMutation
    argument :id, ID, required: true

    field :note, Types::NoteType, null: false
    field :errors, [String], null: false

    def resolve(id:)
      note = Note.find(id)
      if note.destroy
        { note:, errors: [] }
      else
        { note: nil, errors: note.errors.full_messages }
      end
    end
  end
end
