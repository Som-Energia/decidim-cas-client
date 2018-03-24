# frozen_string_literal: true

Decidim::Devise::RegistrationsController.class_eval do
  before_action :force_redirect

  private

  def force_redirect
    redirect_to new_user_session_path
  end
end
