# frozen_string_literal: true

FactoryBot.define do
  factory :note, class: 'Note' do
    name { 'test' }
    content { 'some text' }
  end
end
