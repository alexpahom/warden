class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :clear_xhr_flash

  def clear_xhr_flash
    flash.discard if request.xhr?
  end
end
