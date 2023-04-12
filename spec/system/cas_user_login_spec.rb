# frozen_string_literal: true

require "spec_helper"

describe "Login page", type: :system do
  let!(:organization) { create :organization }

  before do
    switch_to_host(organization.host)
    visit decidim.new_user_session_path
    Devise.cas_base_url = "http://www.example.com/cas_server"
  end

  it "shows a CAS login button" do
    expect(page).to have_content "Sign in with Som Energia"
    expect(page).to have_content "Sign in for administrators"
    expect(page).not_to have_content "Email"
    expect(page).not_to have_content "Password"

    find(".button-login").click

    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
  end

  it "redirects when login with CAS" do
    find(".button--social").click

    # redirects to CAS login
    expect(current_url).to include Devise.cas_base_url
  end
end
