class HomeController < ApplicationController

  def index
    @incomplete_tasks = current_user.tasks.open
    @completed_tasks = current_user.tasks.closed
  end

  def finish
    sleep 2
    @task = current_user.tasks.find(params[:id].gsub(/\D/, ""))
    @task.update_attribute("status", "closed")
  end
  
  def save 
    @task = Task.new(params[:task].merge({ :status => "open" }))
    @task.owner = current_user
    @task.save
  end

end