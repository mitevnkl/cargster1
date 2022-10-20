class ApplicationController < ActionController::Base
  include Pundit::Authorization
  around_action :switch_locale
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_action :verify_authorized, only: :edit, unless: :skip_pundit?
  before_action :authenticate_user!, except: [ :home ]
  before_action :complete_profile, only: [:show, :new], if: :user_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
  end

  def complete_profile
    if current_user.profile_incomplete?
      flash[:alert] = t('complete_profile')
      redirect_to(edit_user_registration_path)
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:terms])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :company_address, :last_name, :company_name, :coc, :vat, :mobile_nr])
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  private

  # def profile_incomplete?
  #   current_user.company_name.nil? || current_user.company_name == ""
  #   current_user.first_name.nil? || current_user.first_name == ""
  #   current_user.last_name.nil? || current_user.last_name == ""
  #   current_user.coc.nil? || current_user.coc == ""
  #   current_user.vat.nil? || current_user.vat == ""
  #   current_user.company_address.nil? || current_user.company_address == ""
  # end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
