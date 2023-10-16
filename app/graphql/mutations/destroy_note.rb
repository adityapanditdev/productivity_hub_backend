class Mutations::DestroyNote < Mutations::BaseMutation
  argument :id, ID, required: true

  field :note, Types::NoteType, null: false
  field :errors, [String], null: false

  def resolve(id:)
    note = Note.find(id)
    if note.destroy
      { note: note, errors: [] }
    else
      { note: nil, errors: note.errors.full_messages }
    end
  end

end
