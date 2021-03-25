FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    status { %w[active inactive].sample }
    phone { Faker::PhoneNumber.cell_phone }
    title { Faker::Name.prefix }
    name { Faker::Name.name }
  end
end
