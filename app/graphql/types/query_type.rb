# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Notes
    field :notes, [Types::NoteType], null: false

    def notes
      Note.all
    end

    field :note, Types::NoteType, null: false do
      argument :id, ID, required: true
    end

    def note(id:)
      Note.find(id)
    end

    # Tasks
    field :tasks, [Types::TaskType], null: false

    def tasks
      Task.all
    end

    field :task, Types::TaskType, null: false do
      argument :id, ID, required: true
    end

    def task(id:)
      Task.find(id)
    end

    # User
    field :users, [Types::UserType], null: false

    def users
      User.all
    end
    # User notes
    field :user_notes, [Types::NoteType], null: false do
      argument :user_id, ID, required: true
    end

    def user_notes(user_id:)
      User.find(user_id).notes
    end

    # User tasks
    field :user_tasks, [Types::TaskType], null: false do
      argument :user_id, ID, required: true
    end

    def user_tasks(user_id:)
      User.find(user_id).tasks
    end
  end
end
