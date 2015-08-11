class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by!(id: params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find_by!(id: params[:id])
  end

  def create
    task = Task.new(task_params)

    if task.save
      flash[:success] = "Task Created"
      redirect_to task
    else
      flash[:danger] = task.errors.full_messages.join(", ")
      redirect_to request.referrer
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :status, :notes, :due_date, :start_date)
    end
end
