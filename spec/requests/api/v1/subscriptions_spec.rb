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

      it 'returns the created subscription' do
        post api_v1_subscriptions_path, params: params

        expect(response_hash[:data][:id]).to be_a(String)
        expect(response_hash[:data][:type]).to eq("subscription")
        expect(response_hash[:data][:attributes]).to include(params)
        expect(response_hash[:data][:attributes][:status]).to eq("active")
      end

      it 'returns a 201 response' do
        post api_v1_subscriptions_path, params: params

        expect(response.status).to eq(201)
      end
    end

    context 'when unsuccessful' do
      let(:params) do
        {
          title: 'My super great subscription',
          frequency: 21,
          customer_id: 12345
        }
      end

      it 'returns an error' do
        post api_v1_subscriptions_path, params: params

        expect(response_hash).to eq(
          {
            errors: ['Customer must exist']
          }
        )
      end

      it 'returns a 400 response' do
        post api_v1_subscriptions_path, params: params

        expect(response.status).to eq(400)
      end
    end
  end
end
