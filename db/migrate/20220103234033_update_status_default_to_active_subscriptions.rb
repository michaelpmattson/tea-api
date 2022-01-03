class UpdateStatusDefaultToActiveSubscriptions < ActiveRecord::Migration[6.1]
  def change
    change_column_default :subscriptions, :status, from: nil, to: 'active'
  end
end
