class Api::V1::SubscriptionSerializer
  include JSONAPI::Serializer

  attributes :customer_id, :frequency, :status, :title
end
