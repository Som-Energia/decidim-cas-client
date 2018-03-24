# frozen_string_literal: true

Decidim::Devise::SessionsController.class_eval do
  helper_method :provider

  private

  def provider
    "SomEnergia"
  end
end
