module YorchStripe
  class Base
    def initialize
      @public_key = Rails.application.credentials.stripe.public_key
      @secret_key = Rails.application.credentials.stripe.secret_key
    end
  end
end