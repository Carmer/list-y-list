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
      task.send_email_to_user_if_desired(params[:task][:title])
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
    task.send_status_change_email

    render nothing: true, status: 200, content_type: 'text/html'
  end

  def delete_attachment
    binding.pry
    task = Task.find_by!(id: params[:id])
    task.remove_attachment

    redirect_to request.referrer
  end


  private

    def task_params
      params.require(:task).permit(:title,
                                   :status,
                                   :notes,
                                   :due_date,
                                   :start_date,
                                   :list_id,
                                   :attachment)
    end
end
