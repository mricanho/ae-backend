require 'rails_helper'

RSpec.describe LectureType, type: :model do
  describe 'Associations' do
    it { should belong_to(:lecture) }
    it { should belong_to(:lecture_group) }
  end
end
