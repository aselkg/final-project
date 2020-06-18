require 'faker'
FactoryBot.define do
  factory :category do |f|
   f.category {Faker::Lorem.word}
  end
end

