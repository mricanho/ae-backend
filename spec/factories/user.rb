FactoryBot.define do
  factory :user do
    sequence(:username) { Faker::Name.last_name }
    sequence(:email) { Faker::Internet.email }
    password { 'foobar' }
    admin { false }
  end
  factory :user_with_appointments, class: 'User' do
    sequence(:username) { Faker::Name.last_name }
    sequence(:email) { Faker::Internet.email }
    password { 'foobar' }
    admin { false }
    appointments { FactoryBot.create_list(:appointment, 5, user: user_with_appointments) }
  end
end
