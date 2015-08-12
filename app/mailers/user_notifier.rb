class UserNotifier < ActionMailer::Base
  default :from => 'andrew@turing.io'

  def send_new_task_email(email_address, task)
    @email_address = email_address
    @task = task
    mail( to: @email_address,
          subject: "You Added a New Task - #{task.title}"  )
  end

  def task_status_changed(email_address, task)
    @email_address = email_address
    @task = task
    mail( to: @email_address,
          subject: "#{task.title} Status Changed"  )
  end

end
