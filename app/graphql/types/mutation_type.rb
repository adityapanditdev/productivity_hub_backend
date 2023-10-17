# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_note, mutation: Mutations::CreateNote
    field :create_task, mutation: Mutations::CreateTask
    field :create_user, mutation: Mutations::CreateUser
    field :update_note, mutation: Mutations::UpdateNote
    field :update_task, mutation: Mutations::UpdateTask
    field :destroy_note, mutation: Mutations::DestroyNote
    field :destroy_task, mutation: Mutations::DestroyTask
  end
end
