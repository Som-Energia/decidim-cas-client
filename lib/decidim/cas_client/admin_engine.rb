# frozen_string_literal: true

module Decidim
  module CasClient
    # This is the engine that runs on the public interface of `CasClient`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::CasClient::Admin

      paths["db/migrate"] = nil
    end
  end
end
