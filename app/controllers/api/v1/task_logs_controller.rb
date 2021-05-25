class Api::V1::TaskLogsController < ApplicationController
  before_action :find_task, only: [:index, :create]

  def index
    @task_logs = @task.task_logs
    render json: @task_logs
  end

  def show
    @task_log = TaskLog.find(params[:id])
    render json: @task_log
  end

  def create
    @task_log = @task.task_logs.new
    @task_log.update(start_time: Date.current)
    @task_log.user = current_user

    if @task_log.save
      render json: @task_log
    else
      render json: @task_log.errors, status: :unprocessable_entity
    end
  end

  def update
    @task_log = TaskLog.find(params[:id])
    @task_log.update(end_time: Date.current)

    if @task_log.save
      render json: @task_log
    else
      render json: @task_log.errors, status: :unprocessable_entity
    end
  end

  private

  def find_task
    @task = Task.find(params[:task_id])
  end
end
