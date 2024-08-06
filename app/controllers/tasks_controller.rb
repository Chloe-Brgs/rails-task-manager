class TasksController < ApplicationController

######## READ

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

######## CREATE

  def new  # show the form in new page
    @task = Task.new # Needed to instantiate the form_with
  end

  def create
    @task = Task.new(task_params) # Will raise ActiveModel::ForbiddenAttributesError si reste params[:task]
    @task.save
    redirect_to tasks_path(@task)
  end

######## UPDATE

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  ######## DELETE

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # No need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
