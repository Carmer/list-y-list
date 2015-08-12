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

  def send_email_to_user_if_desired(task_title)
    if wants_to_be_notified?(task_title)
      email = retrieve_email_address(task_title)
      UserNotifier.send_new_task_email(email, self)
    end
  end

  def send_status_change_email
    if wants_to_be_notified?(self.title)
      email = retrieve_email_address(self.title)
      UserNotifier.task_status_changed(email, self)
    end
  end

  private

  def retrieve_email_address(title)
    index_of_email = title_words(title).index("/cc") + 1
    title_words(title)[index_of_email]
  end

  def title_words(title)
    title.split(" ")
  end

  def wants_to_be_notified?(title)
    title_words(title).include?("/cc")
  end

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
