module DashboardHelper
  def get_task_by_status(tasks, status)
    tasks.select { |task| task.status == status }
  end
  
  def get_user_tasks(tasks, user)
    tasks.select { |task| task.user_id == user.id }
  end
end
