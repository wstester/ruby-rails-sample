class TasksController < ApplicationController
  layout false
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  def create
    defaults = {:is_complete=>"0", :name=>""}
    params = defaults.merge(task_params)
    @task = Task.new(params)
    if @task.name != ""
      @task.is_complete = false
      @task.save
    end
    redirect_to "/"
  end

  def clearComplete
    @tasks = Task.all
    @tasks.each do |task|
      if task.is_complete
        task.destroy
      end
    end
    redirect_to "/"
  end

  def toggleComplete
    @task = Task.find(params[:id])
    @task.is_complete = !(@task.is_complete)
    @task.save
    redirect_to "/"
  end

  private
    def task_params
      params.require(:task).permit(:name, :is_complete)
    end
end
