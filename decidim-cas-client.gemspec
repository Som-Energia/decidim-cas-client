# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/cas_client/version"

Gem::Specification.new do |s|
  s.version = Decidim::CasClient.version
  s.authors = ["Marc Reniu"]
  s.email = ["marc.rs@coditramuntana.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/decidim/decidim"
  s.required_ruby_version = ">= 2.3.1"

  s.name = "decidim-cas_client"
  s.summary = "A decidim CasClient module"
  s.description = "Integration of CAS login and verification."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", "~> 0.11.0.pre1"
  s.add_dependency "decidim-verifications", "~> 0.11.0.pre1"

  s.add_development_dependency "codit-devise-cas-authenticable", "~> 0.0.2"
  s.add_development_dependency "decidim-dev", "~> 0.11.0.pre1"
end
