require 'rails_helper'

RSpec.describe '/api/v1/subscriptions' do
  let(:response_hash) { JSON(response.body, symbolize_names: true) }

  describe 'GET to /' do
    context 'when successful' do
      let(:customer) { create(:customer) }
      let!(:active_subs) { create_list(:subscription, 2, customer: customer) }
      let!(:cancelled_subs) { create_list(:subscription, 2, customer: customer, status: 'cancelled') }
      let(:params) do
        { customer_id: customer.id }
      end

      it 'returns all the customers subscriptions' do
        get api_v1_customers_subscriptions_path, params: params

        expect(response_hash[:data]).to be_an(Array)
        expect(response_hash[:data].length).to eq(active_subs.length + cancelled_subs.length)
      end

      it 'returns a 200 response status' do
        get api_v1_customers_subscriptions_path, params: params

        expect(response.status).to eq(200)
      end
    end

    context 'when unsuccessful' do
      let!(:subs) { create_list(:subscription, 5) }
      let(:params) do
        { customer_id: 0 }
      end

      it 'returns a useful error message' do
        get api_v1_customers_subscriptions_path, params: params

        expect(response_hash).to eq(error: "Couldn't find Customer with 'id'=0")
      end

      it 'returns a 404 response' do
        get api_v1_customers_subscriptions_path, params: params

        expect(response.status).to eq(404)
      end
    end
  end
end
