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
        resource :cas_session, only: [:new], path: "users/cas/sign_in", controller: "/decidim/cas_client/authorizations", as: "user_cas_session"

        root to: "authorizations#new"
      end

      config.to_prepare do
        Decidim::User.include(Decidim::CasClient::UserExtensions)
      end

      initializer "decidim_cas_client.controller_overrides", after: "decidim.action_controller" do
        config.to_prepare do
          Decidim::Devise::SessionsController.include(Decidim::CasClient::SessionsControllerAddons)
        end
      end

      initializer "decidim_cas_client.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("app/packs", root)
      end
    end
  end
end
