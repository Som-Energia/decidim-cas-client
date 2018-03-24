# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module CasClient
    # This is the engine that runs on the public interface of decidim-cas-client.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::CasClient

      require "devise_cas_authenticatable"
      require "decidim/verifications"

      routes do
        resource :authorizations, only: %i[new], as: :authorization

        root to: "authorizations#new"
      end

      initializer :append_migrations do |app|
        unless app.root.to_s.match root.to_s
          config.paths["db/migrate"].expanded.each do |expanded_path|
            app.config.paths["db/migrate"] << expanded_path
          end
        end
      end

      config.to_prepare do
        Dir.glob(Decidim::CasClient::Engine.root + "app/decorators/**/*_decorator*.rb").each do |c|
          require_dependency(c)
        end
      end
    end
  end
end
