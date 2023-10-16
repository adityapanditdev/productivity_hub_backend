FactoryBot.define do
  factory :note, class: 'Note' do
    name { 'test' }
    content { 'some text' }
  end
end
