# frozen_string_literal: true

module Decidim
  module CasClient
    class AuthorizationsController < Decidim::ApplicationController
      skip_before_action :verify_authenticity_token

      def new
        redirect_to "/admin" if current_user.present? && !current_user&.cas_user?
      end
    end
  end
end
