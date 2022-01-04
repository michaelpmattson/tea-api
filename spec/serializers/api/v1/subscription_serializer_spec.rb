require 'rails_helper'

RSpec.describe 'subscription serializer' do
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
end
