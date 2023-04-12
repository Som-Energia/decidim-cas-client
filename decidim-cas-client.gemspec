# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/cas_client/version"

Gem::Specification.new do |s|
  s.version = Decidim::CasClient::VERSION
  s.authors = ["Marc Reniu", "Isaac Massot"]
  s.email = ["marc.rs@coditramuntana.com", "isaac.mg@coditramuntana.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/Som-Energia/decidim-cas-client"
  s.required_ruby_version = ">= 2.7.0"

  s.name = "decidim-cas_client"
  s.summary = "A decidim CasClient module"
  s.description = "Integration of CAS login and verification."

  s.files = Dir["{app,config,lib,db}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  DECIDIM_VERSION = Decidim::CasClient::COMPAT_DECIDIM_VERSION

  s.add_dependency "codit-devise-cas-authenticable"
  s.add_dependency "decidim-core", DECIDIM_VERSION
  s.add_dependency "decidim-verifications", DECIDIM_VERSION
  s.add_development_dependency "decidim-dev", DECIDIM_VERSION
end
