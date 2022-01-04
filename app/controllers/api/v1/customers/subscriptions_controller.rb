class Api::V1::Customers::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    if customer
      render json: Api::V1::SubscriptionSerializer.new(customer.subscriptions), status: :ok
    else
    end
  end
end
