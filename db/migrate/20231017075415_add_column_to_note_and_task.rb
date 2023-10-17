# frozen_string_literal: true

class AddColumnToNoteAndTask < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :user, foreign_key: true
    add_reference :notes, :user, foreign_key: true
  end
end
