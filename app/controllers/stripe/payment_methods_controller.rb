module Stripe
  class PaymentMethodsController < ApplicationController
    def create
      @yorch_stripe_payment_method = YorchStripe::PaymentMethod.new(payment_method_id, customer_stripe_id)

      @yorch_stripe_payment_method.save
    end

    private

    def payment_method_id
      params.dig(:payment_method_id)
    end

    def customer_stripe_id
      current_user.customer_stripe_id
    end
  end
end
