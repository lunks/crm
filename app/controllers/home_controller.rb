class HomeController < ApplicationController

  def index
    @incomplete_tasks = current_user.tasks.open
    @completed_tasks = current_user.tasks.closed
  end

  def finish
    sleep 2
    @task = current_user.tasks.find(params[:id])
    @task.update_attribute("status", "closed")
  end

end