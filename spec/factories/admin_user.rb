FactoryBot.define do
  factory :admin_user, class: 'User' do
    sequence(:username) { Faker::Name.last_name }
    sequence(:email) { Faker::Internet.email }
    password { 'foobar' }
    admin { true }
  end
  factory :loged_in_admin_user, class: 'User' do
    admin_user
    token { AuthenticationTokenService.encode(admin_user) }
  end
end
