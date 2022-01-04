require 'rails_helper'

RSpec.describe 'subscription serializer' do
  describe 'initialize' do
    let(:subscription) { create(:subscription) }

    it 'serializes subscription object into json' do
      json = Api::V1::SubscriptionSerializer.new(subscription).serializable_hash

      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_a(Hash)
      expect(json[:data][:id]).to be_a(String)
      expect(json[:data][:type]).to eq(:subscription)
      expect(json[:data][:attributes][:customer_id]).to be_an(Integer)
      expect(json[:data][:attributes][:frequency]).to be_an(Integer)
      expect(json[:data][:attributes][:status]).to be_a(String)
      expect(json[:data][:attributes][:title]).to be_a(String)
    end

    let(:subscriptions) { create_list(:subscription, 5) }

    it 'can serialize a list' do
      json = Api::V1::SubscriptionSerializer.new(subscriptions).serializable_hash

      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_an(Array)
      json[:data].each do |sub|
        expect(sub[:id]).to be_a(String)
        expect(sub[:type]).to eq(:subscription)
        expect(sub[:attributes][:customer_id]).to be_an(Integer)
        expect(sub[:attributes][:frequency]).to be_an(Integer)
        expect(sub[:attributes][:status]).to be_a(String)
        expect(sub[:attributes][:title]).to be_a(String)
      end
    end
  end
end
