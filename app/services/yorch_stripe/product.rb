module YorchStripe
  class Product < Base
    def create_product(product)
      Stripe.api_key = @secret_key

      res = Stripe::Product.create({
        name: product.name,
        active: true,
        default_price_data: {
          currency: 'mxn',
          unit_amount_decimal: random_price * 100
        }
      })

      res[:id]
    end

    private

    def random_price
      rand(10.0..50.0).to_i
    end
  end
end