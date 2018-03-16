# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module CasClient
    # This is the engine that runs on the public interface of decidim-cas-client.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::CasClient

      routes do
        # Add engine routes here
        # resources :decidim-cas-client
        # root to: "decidim-cas-client#index"
      end

      # initializer "decidim_cas-client.assets" do |app|
      #   app.config.assets.precompile += %w[decidim_cas-client_manifest.js decidim_decidim-cas-client_manifest.css]
      # end

      # initializer "decidim_cas-client.inject_abilities_to_user" do |_app|
      #   Decidim.configure do |config|
      #     config.abilities += ["Decidim::CasClient::Abilities::CurrentUserAbility"]
      #   end
      # end
    end
  end
end
