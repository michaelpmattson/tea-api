require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'validations' do
    it { should belong_to(:customer) }
  end
end
