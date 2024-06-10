class ClockIn < ApplicationRecord
  belongs_to :user

  validates :clocked_at, presence: true
  validate :clocked_at_is_today

  def self.today
    where(clocked_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

  private

  def clocked_at_is_today
    return if clocked_at.blank?

    if clocked_at.to_date != Date.current
      errors.add(:clocked_at, "must be today")
    end
  end
end
