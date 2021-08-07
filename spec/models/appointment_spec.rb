require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'testing associations' do
    it { should belong_to(:user) }
    it { should belong_to(:lecture) }
  end

  describe 'testing validations' do
    it { should validate_presence_of(:lecture_id) }
    it { should validate_presence_of(:user_id) }
    it { should allow_value(DateTime.tomorrow).for(:start_time) }
  end
end
