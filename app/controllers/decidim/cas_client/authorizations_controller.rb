# frozen_string_literal: true

module Decidim
  module CasClient
    class AuthorizationsController < Decidim::ApplicationController
      skip_authorization_check

      def new
      end
    end
  end
end
