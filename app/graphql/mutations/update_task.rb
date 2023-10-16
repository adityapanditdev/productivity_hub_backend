# app/graphql/mutations/update_task.rb
class Mutations::UpdateTask < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: false
  argument :description, String, required: false

  field :task, Types::TaskType, null: true
  field :errors, [String], null: false

  def resolve(id:, name:, description:)
    task = Task.find(id)
    if task.update(name: name, description: description)
      { task: task, errors: [] }
    else
      { task: nil, errors: task.errors.full_messages }
    end
  end
end
