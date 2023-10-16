# app/graphql/mutations/update_task.rb
class Mutations::DestroyTask < Mutations::BaseMutation
  argument :id, ID, required: true

  field :task, Types::TaskType, null: true
  field :errors, [String], null: false

  def resolve(id:)
    task = Task.find(id)
    if task.destroy
      { task: task,  errors: [] }
    else
      { task: nil, errors: task.errors.full_messages }
    end
  end
end
