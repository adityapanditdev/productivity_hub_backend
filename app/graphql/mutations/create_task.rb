class Mutations::CreateTask < Mutations::BaseMutation
  argument :name, String, required: true
  argument :description, String, required: true

  field :task, Types::TaskType, null: true
  field :errors, [String], null: false

  def resolve(name:, description:)
    task = Task.new(name: name, description: description)
    if task.save
      { task: task, errors: [] }
    else
      { task: nil, errors: task.errors.full_messages }
    end
  end
end
