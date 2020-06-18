require 'faker'
FactoryBot.define do

# post factory with a `belongs_to` association for the user
  factory :product do  |f|
     f.title {Faker::Lorem.word}
     f.content { Faker::Lorem.paragraph}
     f.price { Faker::Number.number }
   end
end
