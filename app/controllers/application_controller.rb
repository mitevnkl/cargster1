class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [ :index ]
  before_action :configure_permitted_parameters, if: :devise_controller?

  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  include Pundit::Authorization

  # Pundit: allow-list approach
  after_action :verify_authorized, only: :edit, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :edit, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(post_path)
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :terms, :company_address, :last_name, :company_name, :coc, :vat, :viber, :whatsapp, :mobile_nr])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :company_address, :last_name, :company_name, :coc, :vat, :viber, :whatsapp, :mobile_nr])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
