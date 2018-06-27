# frozen_string_literal: true

module Decidim
  module CasClient
    class AuthorizationsController < Decidim::ApplicationController
      skip_before_action :verify_authenticity_token

      def new
      end
    end
  end
end
