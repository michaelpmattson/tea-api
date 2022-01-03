require 'rails_helper'

RSpec.describe '/api/v1/subscriptions' do
  let(:response_hash) { JSON(response.body, symbolize_names: true) }

  describe 'POST to /' do
    context 'when successful' do
      let(:customer) { create(:customer) }
      let(:params) do
        {
          title: 'My super great subscription',
          frequency: 21,
          customer_id: customer.id
        }
      end

      it 'creates a subscription' do
        expect { post api_v1_subscriptions_path, params: params}.to change {Subscription.count}
      end

      # it 'returns the created subscription' do
      #   post api_subscriptions_path, params: params
      #
      #   expect(response_hash).to include(params)
      # end
      #
      # it 'updates the subscription rating' do
      #   expect { post api_subscriptions_path, params: params}.to change {Book.first.rating }
      # end
      #
      # it 'returns a 201 response' do
      #   post api_subscriptions_path, params: params
      #
      #   expect(response.status).to eq(201)
      # end
    end

    context 'when unsuccessful'
  end
end
