# frozen_string_literal: true

module Decidim
  module CasClient
    module LoginSnippets
      extend ActiveSupport::Concern

      included do
        helper_method :snippets
      end

      def snippets
        @snippets ||= Decidim::Snippets.new

        unless @snippets.any?(:action_cas_client_sign_in)
          @snippets.add(:action_cas_client_sign_in, ActionController::Base.helpers.javascript_pack_tag("decidim_cas_client"))
          @snippets.add(:action_cas_client_sign_in, ActionController::Base.helpers.stylesheet_pack_tag("decidim_cas_client"))
          @snippets.add(:head, @snippets.for(:action_cas_client_sign_in))
        end

        @snippets
      end
    end
  end
end
