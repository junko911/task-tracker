class Api::V1::CustomersController < ApplicationController
  before_action :find_customer, only: [:show, :update, :destroy]

  def index
    render json: Customer.all
  end

  def show
    render json: @customer
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def update
    @customer.update(:customer_params)
    render json: @customer
  end

  def destroy
    @customer.destroy
  end

  private

  def customer_params
    params.require(:customer).permit(:name)
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end
end
