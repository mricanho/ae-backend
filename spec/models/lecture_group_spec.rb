require 'rails_helper'

RSpec.describe LectureGroup, type: :model do
  describe 'Associations' do
    it { should have_many(:lecture_types) }
    it { should have_many(:lectures).through(:lecture_types) }
  end
end
