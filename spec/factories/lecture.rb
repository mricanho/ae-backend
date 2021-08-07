FactoryBot.define do
  factory :lecture do
    name { Faker::TvShows::Friends.character }
  end
end
def create_lectures(lectures_count = 15)
  FactoryBot.create_list(:lecture, lectures_count)
end
