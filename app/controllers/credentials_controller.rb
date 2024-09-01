class CredentialsController < ApplicationController
  def stripe
    if is_domain_valid?
      render json: { public: Rails.application.credentials.stripe.public_key, secret: Rails.application.credentials.stripe.secret_key }, status: :ok
    else
      render json: { error: "This domain is not valid" }, status: :unauthorized
    end
  end

  private

  def is_domain_valid?
    current_domain = request.domain

    Rails.application.credentials.domains_allowed.local.url.eql? current_domain
  end
end