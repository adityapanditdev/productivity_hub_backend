class Mutations::UpdateNote < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :content, String, required: false

    field :note, Types::NoteType, null: false
    field :errors, [String], null: false

  def resolve(id:, name:, content:)
    note = Note.find(id)
    if note.update(name: name, content: content)
      { note: note, errors: [] }
    else
      { note: nil, errors: note.errors.full_messages }
    end
  end
end