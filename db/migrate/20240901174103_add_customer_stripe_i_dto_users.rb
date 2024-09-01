class AddCustomerStripeIDtoUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :customer_stripe_id, :string
  end
end
