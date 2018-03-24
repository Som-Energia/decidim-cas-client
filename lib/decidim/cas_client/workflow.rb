# frozen_string_literal: true

Decidim::Verifications.register_workflow(:cas_som_energia) do |workflow|
  workflow.engine = Decidim::CasClient::Engine
end
