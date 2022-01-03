class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :title
      t.string :status
      t.integer :frequency

      t.timestamps
    end
  end
end
