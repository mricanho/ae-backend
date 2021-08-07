FactoryBot.define do
  factory :lecture_group do
    name { Faker::Name.name }
    description { Faker::Games::HeroesOfTheStorm.battleground }
    img_thumb { Faker::Games::HeroesOfTheStorm.battleground }
    lectures { create_lectures(3) }
  end
end

def create_group(group_count = 4)
  FactoryBot.create_list(:lecture_group, group_count)
end
