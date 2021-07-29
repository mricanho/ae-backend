class Lecture < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :lecture_types, dependent: :destroy
  has_many :group, through: :lecture_types, source: :lecture_group

  scope :all_with_associations, -> { all.includes(:group) }
end
