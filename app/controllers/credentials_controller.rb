class CredentialsController < ApplicationController
  def stripe
    render json: { public: Rails.application.credentials.stripe.public_key, secret: Rails.application.credentials.stripe.secret_key }, status: :ok
    # if is_domain_valid?
    # else
    #   render json: { error: "This domain is not valid" }, status: :unauthorized
    # end
  end

  private

  # def is_domain_valid?
  #   current_domain = request.domain

  #   puts current_domain
  #   puts Rails.application.credentials.domains_allowed.local.urls.include? current_domain

  #   true

  # end
end