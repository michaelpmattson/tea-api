class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(allowed_params)

    if subscription.save
      render json: Api::V1::SubscriptionSerializer.new(subscription), status: :created
    else
      render json: { errors: subscription.errors.full_messages }, status: :bad_request
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    if subscription.update(status: params[:status])
      render json: Api::V1::SubscriptionSerializer.new(subscription), status: :ok
    else
      render json: { errors: subscription.errors.full_messages }, status: :bad_request
    end
  end

  private

  def allowed_params
    params.permit(:title, :frequency, :customer_id)
  end
end
