class LectureGroup < ApplicationRecord
  has_many :lecture_types
  has_many :lectures, through: :lecture_types
end
