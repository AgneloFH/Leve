# frozen_string_literal: true

class ApiController < ApplicationController
  include Pundit::Authorization
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :role])
  end

  private

  def user_not_authorized
    flash[:alert] = "Ação negada"
    redirect_to(request.referrer || root_path)
  end
end
end
