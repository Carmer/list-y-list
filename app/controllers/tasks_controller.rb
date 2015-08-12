class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by!(id: params[:id])
  end

  def new
    @task = Task.new(list_id: params[:list_id])
  end

  def edit
    @task = Task.find_by!(id: params[:id])
  end

  def create
    task = Task.create(task_params)
    if task.save
      flash[:success] = "Task Created"
      redirect_to list_path(task.list_id)
    else
      flash[:danger] = task.errors.full_messages.join(", ")
      redirect_to list_path(task.list_id)
    end
  end

  def update
    task = Task.find_by!(id: params[:id])
    if task.update(task_params)
      flash[:success] = "Task Updated"
      redirect_to list_path(task.list.id)
    else
      flash[:danger] = task.errors.full_messages.join(", ")
      redirect_to edit_task_path
    end
  end

  def js_update
    task = Task.find_by!(id: params[:id])
    task.status_update
    redirect_to request.referrer
  end

  private

    def task_params
      params.require(:task).permit(:title, :status, :notes, :due_date, :start_date, :list_id)
    end
end
