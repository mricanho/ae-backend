class Lecture < ApplicationRecord
  has_many :appointments, dependent: :destroy
end
