# frozen_string_literal: true

module Decidim
  module CasClient
    module UserExtensions
      extend ActiveSupport::Concern

      included do
        devise :cas_authenticatable

        # Remove uniqueness validator for email field
        # ONLY for CAS users
        validations = { email: ActiveRecord::Validations::UniquenessValidator }
        validations.each do |field, validation_type|
          _validators[field]
            .find_all { |v| v.is_a? validation_type }.each do |validator|
              validator.instance_variable_set :@options, validator.options.merge({ unless: :cas_user? })
            end
        end

        def after_confirmation
          return unless cas_user?

          authorization = Decidim::Authorization.find_or_initialize_by(
            user: self,
            name: "cas_som_energia"
          )
          authorization.grant!
        end

        def grant_authorization
          after_confirmation
        end

        def cas_extra_attributes=(extra_attributes)
          self.extra_attributes ||= {}
          extra_attributes.each do |name, value|
            case name.to_sym
            when :email
              self.email = value
            when :soci
              self.extra_attributes[:soci] = value
            when :username
              self.extra_attributes[:username] = value
            when :locale
              self.locale = value
            end
          end
        end

        def cas_user?
          username.present?
        end

        def self.find_for_authentication(warden_conditions)
          if warden_conditions.has_key?(:env)
            organization = warden_conditions.dig(:env, "decidim.current_organization")
            where(%( (extra_attributes->'soci') IS NULL ))
              .find_by(
                email: warden_conditions[:email],
                decidim_organization_id: organization.id
              )
          else
            where(%(extra_attributes @> '{"soci": "#{warden_conditions[:soci]}"}'))
              .find_by(
                username: warden_conditions[:username],
                decidim_organization_id: warden_conditions[:decidim_organization_id]
              )
          end
        end
      end
    end
  end
end
