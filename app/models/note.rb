# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
end
