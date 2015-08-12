class Task < ActiveRecord::Base
  belongs_to :list

  validates :title, presence: true, length: { minimum: 1 }
  validate :start_date_cannot_be_in_the_past
  validate :due_date_cannot_be_in_the_past_or_before_start

  after_create :set_start_date_and_due_date_if_none_specified

  def completion_status
    if status
      "Complete"
    else
      "Incomplete"
    end
  end

  def default_filter?
    status || start_date <= Date.today
  end

  def status_update
    new_status = !status
    self.update(status: new_status)
  end

  def not_in_the_future?
    if start_date > Date.today
      false
    else
      true
    end
  end

  private

  def set_start_date_and_due_date_if_none_specified
    self.update(start_date: Date.today ) if start_date.nil?
    self.update(due_date: Date.today + 1 ) if due_date.nil?
  end

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be before today") if
    !start_date.blank? && start_date < Date.today
  end

  def due_date_cannot_be_in_the_past_or_before_start
    errors.add(:due_date, "can't be before today") if
    !due_date.blank? && due_date < Date.today
  end
end
