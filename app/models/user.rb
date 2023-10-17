class User < ApplicationRecord
  has_many :notes
  has_many :tasks
  validates :name, presence: true
  validates :email, presence: true
end
