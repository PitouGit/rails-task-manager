class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id]) # afficher la tâche correspondant à l'id de l'url (ici params[:id] fait référence à l'url)
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to tasks_path(task.id)
  # aller dans my task avec la nouvelle task créée et tout afficher
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to index_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to index_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :completed, :details)
  end
end
