class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :user_logged_in?

  add_flash_types :success, :info, :warning, :danger

  private

  def user_logged_in?
    return if logged_in?

    redirect_to login_path
  end
end
