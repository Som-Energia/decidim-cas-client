# frozen_string_literal: true

require "spec_helper"

module Decidim::CasClient
  describe AuthorizationsController, type: :controller do
    routes { Decidim::CasClient::Engine.routes }

    let(:organization) { create(:organization) }

    before do
      request.env["decidim.current_organization"] = organization
    end

    describe "GET new" do
      it "redirects to the CAS server" do
        get :new

        expect(response).to render_template("decidim/cas_client/authorizations/new")
      end
    end
  end
end
