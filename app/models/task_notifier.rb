class TaskNotifier < ActionMailer::Base

  def update_notification(task)
    recipients %('#{task.owner.name}' <#{task.owner.email}>)
    from "crm@example.org"
    subject "Task Update Notification"
    body :task => task
  end

end
