class AddProductStripeIdToBooks < ActiveRecord::Migration[7.2]
  def change
    add_column :books, :product_stripe_id, :string
  end
end
