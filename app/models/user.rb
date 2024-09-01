class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :set_customer_stripe_id

  private

  def set_customer_stripe_id
    @yorch_stripe_customer = YorchStripe::Customer.new

    self.update(customer_stripe_id: @yorch_stripe_customer.create_customer(self))
  end
end
