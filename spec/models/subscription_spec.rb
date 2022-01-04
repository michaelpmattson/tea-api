require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should belong_to(:customer) }
  end

  describe 'validations' do
    it { should validate_inclusion_of(:status).
      in_array(['active', 'cancelled']).
      with_message("must be 'active' or 'cancelled'") }
  end
end
