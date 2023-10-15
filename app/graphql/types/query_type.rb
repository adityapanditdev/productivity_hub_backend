# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Notes
    field :notes, [Types::NoteType], null: false

    def notes
      Note.all
    end

    # Tasks
    field :tasks, [Types::TaskType], null: false

    def tasks
      Task.all
    end
  end
end
