class Api::V1::TasksController < ApplicationController
  before_action :find_project, only: [:index, :create]
  before_action :find_task, only: [:show, :update, :destroy]

  def index
    @tasks = @project.tasks
    render json: @tasks
  end

  def show
    render json: @task
  end

  def create
    @task = Task.new(task_params)

    if @project.tasks << @task
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    @task.update(task_params)
    render json: @task
  end

  def destroy
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
