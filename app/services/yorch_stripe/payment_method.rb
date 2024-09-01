module YorchStripe
  class PaymentMethod < Base
    def initialize(payment_method_id, customer_id)
      super()
      @payment_method_id = payment_method_id
      @customer_id = customer_id
    end
    
    def save
      Stripe.api_key = @secret_key

      Stripe::PaymentMethod.attach(@payment_method_id, { customer: @customer_id })
    end
  end
end