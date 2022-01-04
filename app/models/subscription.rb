class Subscription < ApplicationRecord
  belongs_to :customer

  validates :status, inclusion: { in: %w(active cancelled),
    message: "must be 'active' or 'cancelled'" }
end
