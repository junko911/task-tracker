class Api::V1::CustomersController < ApplicationController
  def create
    @customer = Customer.create(customer_params)

    if @customer.valid?
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  private

  def customer_params
    params.require(:customer).permit!
  end
end
