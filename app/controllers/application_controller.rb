class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  around_action :set_time_zone
  before_action :ensure_site
  before_action :set_locale

  rescue_from Authie::Session::ValidityError, :with => :auth_session_error

  private
  def set_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
  end

  private
  def auth_session_error
    redirect_to admin_login_path, :alert => "Your session is no longer valid. Please login again to continue..."
  end

  def set_time_zone
    if has_site?
      Time.zone = site.time_zone
      Chronic.time_class = Time.zone
    end
    yield
  ensure
    Chronic.time_class = Time
    Time.zone = nil
  end

  def site
    @site ||= Site.first || :none
  end
  helper_method :site

  def has_site?
    site.is_a?(Site)
  end
  helper_method :has_site?

  def ensure_site
    unless site.is_a?(Site)
      redirect_to setup_path(:step1)
    end
  end

end
