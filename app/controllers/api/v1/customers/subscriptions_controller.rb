class Api::V1::Customers::SubscriptionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    customer = Customer.find(params[:customer_id])
    render json: Api::V1::SubscriptionSerializer.new(customer.subscriptions), status: :ok
  end

  private

  def not_found(error)
    render json: { error: error.message }, status: 404
  end
end
