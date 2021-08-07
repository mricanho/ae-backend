class Appointment < ApplicationRecord
  before_create :manipulate_date

  belongs_to :user
  belongs_to :lecture

  validates :lecture_id, presence: true
  validates :user_id, presence: true

  validate :lecture_exists?

  validate :after_today?

  validate :o_clock_time?

  validate :not_in_the_past?

  validate :after_two_months?

  def self.current_user_appointments(user)
    where(user_id: user.id).where('start_time > ?', DateTime.now).includes(:lecture)
  end

  private

  def manipulate_date
    self.start_time = start_time.to_datetime
    self.end_time = start_time + 30.minutes
  end

  def lecture_exists?
    return unless Lecture.find_by_id(lecture_id).nil?

    errors.add(:error, 'You must select a valid Class for the appointment.')
  end

  def after_today?
    return unless !start_time.nil? && start_time < DateTime.tomorrow && start_time.day == DateTime.now.day

    errors.add(:error, "This date it's taken, please choose another.")
  end

  def o_clock_time?
    return unless !start_time.nil? && start_time.min != 0 && start_time.min != 30

    errors.add(:error, "Sorry. The appointment can only be setted in 30 min partials. e.g. '15:00' or '15:30'.")
  end

  def not_in_the_past?
    return unless !start_time.nil? && start_time < DateTime.now

    errors.add(:error, "We can't travel back in time, choose another slot, please!")
  end

  def after_two_months?
    return unless !start_time.nil? && start_time > DateTime.now + 2.months

    errors.add(:error, 'Two months is the limit, please choose a sooner date')
  end
end
