class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :clear_xhr_flash

  def clear_xhr_flash
    flash.discard if request.xhr?
  end

  def fetch_suite_for_section
    @suite = Suite.find(params[:suite_id])
  end

  def prepare_for_case
    @case = Case.new
  end

  def fetch_section
    @section = Section.find(params[:id])
  end
end
