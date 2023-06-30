class Admin::SessionsController < Admin::BaseController

  layout 'login'
  skip_before_action :login_required, :only => [:new, :create]

  def new
    if Staytus::Config.demo?
      params[:email] = 'admin@example.com'
      params[:password] = 'password'
    end
  end

  def create
    if Staytus::Config.demo?
      user = User.first
    else
      user = User.authenticate(params[:email], params[:password], request.ip)
    end
    if user.is_a?(User)
      create_auth_session(user)
      redirect_to admin_root_path
    else
      flash.now.alert = 'The email address and/or password entered was incorrect. Please check and try again.'
      render 'new'
    end
  rescue LogLogins::LoginBlocked => e
    flash.now.alert = 'Login attempts have been blocked due to too many invalid passwords. Please try later.'
    render 'new'
  end

  def destroy
    auth_session.invalidate!
    redirect_to admin_login_path
  end

end
