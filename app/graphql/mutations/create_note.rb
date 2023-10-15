class Mutations::CreateNote < Mutations::BaseMutation
  argument :name, String, required: true
  argument :content, String, required: true

  field :note, Types::NoteType, null: true
  field :errors, [String], null: false

  def resolve(name:, content:)
    note = Note.new(name: name, content: content)
    if note.save
      {
        note: note,
        errors: []
      }
    else
      {
        note: nil,
        errors: note.errors.full_messages
      }
    end
  end
end
