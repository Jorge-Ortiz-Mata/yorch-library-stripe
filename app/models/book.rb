class Book < ApplicationRecord
  after_create :set_product_stripe_id

  private

  def set_product_stripe_id
    @yorch_stripe_product = YorchStripe::Product.new

    self.update(product_stripe_id: @yorch_stripe_product.create_product(self))
  end
end
