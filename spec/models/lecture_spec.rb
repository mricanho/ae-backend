require 'rails_helper'

RSpec.describe Lecture, type: :model do
  describe 'testing associations' do
    it { should have_many(:appointments) }
  end
end