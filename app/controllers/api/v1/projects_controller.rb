class Api::V1::ProjectsController < ApplicationController
  before_action :find_customer, only: [:index, :create]
  before_action :find_project, only: [:show, :update, :destroy]

  def index
    @projects = @customer.projects
    render json: @projects
  end

  def show
    render json: @project
  end

  def create
    @project = Project.new(project_params)

    if @customer.projects << @project
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def update
    @project.update(:project_params)
    render json: @project
  end

  def destroy
    @project.destroy
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def find_customer
    @customer = Customer.find(params[:customer_id])
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
