# frozen_string_literal: true

require "rails"
require "decidim/core"
require "deface"

module Decidim
  module CasClient
    # This is the engine that runs on the public interface of decidim-cas-client.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::CasClient

      require "devise_cas_authenticatable"
      require "decidim/verifications"

      routes do
        resource :authorizations, only: [:new], as: :authorization

        root to: "authorizations#new"
      end

      config.to_prepare do
        Decidim::User.include(Decidim::CasClient::UserExtensions)
      end

      initializer "decidim_cas_client.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("app/packs", root)
      end
    end
  end
end
