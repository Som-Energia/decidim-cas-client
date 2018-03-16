# frozen_string_literal: true

module Decidim
  module CasClient
    # This is the engine that runs on the public interface of `CasClient`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::CasClient::Admin

      paths["db/migrate"] = nil

      routes do
        # Add admin engine routes here
        # resources :decidim-cas-client do
        #   collection do
        #     resources :exports, only: [:create]
        #   end
        # end
        # root to: "decidim-cas-client#index"
      end

      # initializer "decidim_cas-client.inject_abilities_to_user" do |_app|
      #   Decidim.configure do |config|
      #     config.admin_abilities += ["Decidim::CasClient::Abilities::AdminAbility"]
      #   end
      # end

      # def load_seed
      #   nil
      # end
    end
  end
end
