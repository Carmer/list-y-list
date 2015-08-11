class Task < ActiveRecord::Base
  belongs_to :lists

  validates :title, presence: true, length: { minimum: 1 }
  validate :start_date_cannot_be_in_the_past
  validate :due_date_cannot_be_in_the_past


  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be before today") if
    !start_date.blank? && start_date < Date.today
  end

  def due_date_cannot_be_in_the_past
    errors.add(:due_date, "can't be before today") if
    !due_date.blank? && due_date < Date.today
  end
end
