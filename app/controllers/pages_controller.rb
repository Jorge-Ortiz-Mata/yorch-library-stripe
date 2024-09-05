class PagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @payment_methods = user_payment_methods[:data]
  end

  private

  def user_payment_methods
    @user_payment_methods ||= YorchStripe::PaymentMethod.get_payment_methods(current_user.customer_stripe_id)
  end
end
