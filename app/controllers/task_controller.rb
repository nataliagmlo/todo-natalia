class TaskController < ApplicationController

	before_filter :check_user, :only => :show

  def index
  	@tasks = Task.all
  end

  def show
  end

  protected

  def check_user
  	@task = Task.find params["id"]
	
	redirect_to(tasks_path) if @task.user.nil?  
  end
end
