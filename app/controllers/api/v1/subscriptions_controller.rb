class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(allowed_params)

    if subscription.save
      render json: subscription, status: :created
    else
      
    end
  end

  private

  def allowed_params
    params.permit(:title, :frequency, :customer_id)
  end
end
