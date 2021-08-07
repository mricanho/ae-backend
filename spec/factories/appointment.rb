FactoryBot.define do
  factory :appointment do
    start_time { DateTime.tomorrow }
    car
    user
  end
end
