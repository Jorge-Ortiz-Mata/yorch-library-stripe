module YorchStripe
  class Customer < Base
    def create_customer(user)
      Stripe.api_key = @secret_key

      res = Stripe::Customer.create({email: user.email})

      res[:id]
    end
  end
end