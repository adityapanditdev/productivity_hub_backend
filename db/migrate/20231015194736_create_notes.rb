# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.string :name, null: false
      t.text :content

      t.timestamps
    end
  end
end
