# frozen_string_literal: true

require "spec_helper"

module Decidim
  describe User do
    subject { user }

    let!(:existing_user) { create(:user) }
    let(:user) { build(:user, organization: existing_user.organization, username: username, email: email) }
    let(:username) { "username" }
    let(:email) { "some@email" }
    let(:extra_attributes) do
      {
        email: "new@email",
        soci: "1234",
        username: "new_username",
        locale: "ca"
      }
    end

    it { is_expected.to be_valid }

    it "has devise authenticatable" do
      expect(subject.devise_modules).to include(:cas_authenticatable)
    end

    it "is a cas_user" do
      expect(subject).to be_cas_user
    end

    it "creates an authorization on confirming" do
      subject.save
      expect { subject.confirm }.to change { Decidim::Authorization.count }.by(1)
    end

    it "can set cas attributes" do
      subject.cas_extra_attributes = extra_attributes
      expect(subject.email).to eq(extra_attributes[:email])
      expect(subject.extra_attributes[:soci]).to eq(extra_attributes[:soci])
      expect(subject.extra_attributes[:username]).to eq(extra_attributes[:username])
      expect(subject.locale).to eq(extra_attributes[:locale])
    end

    it "can find for authentication by env warden conditions" do
      expect(Decidim::User.find_for_authentication(env: {
                                                     "decidim.current_organization" => existing_user.organization
                                                   },
                                                   email: existing_user.email)).to eq(existing_user)
    end

    it "can find for authentication by soci warden conditions" do
      subject.cas_extra_attributes = extra_attributes
      subject.save
      expect(Decidim::User.find_for_authentication(soci: extra_attributes[:soci],
                                                   username: username,
                                                   decidim_organization_id: subject.organization.id)).to eq(subject)
    end

    context "when is no cas user" do
      let(:username) { nil }

      it "is not a cas_user" do
        expect(subject).not_to be_cas_user
      end

      it "does not create an authorization on confirming" do
        subject.save
        expect { subject.confirm }.to change { Decidim::Authorization.count }.by(0)
      end

      context "when email exists" do
        let(:email) { existing_user.email }

        it "email cannot be repeated" do
          expect(subject).to be_invalid
        end
      end
    end
  end
end
