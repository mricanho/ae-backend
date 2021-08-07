class LectureType < ApplicationRecord
  belongs_to :lecture
  belongs_to :lecture_group
end
