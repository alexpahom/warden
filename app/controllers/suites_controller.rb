class SuitesController < ApplicationController
  before_action :fetch_suite, only: %i(show edit update)

  def index
    @suites = Suite.all
  end

  def new
    @suite = Suite.new
  end

  def show; end

  def edit; end

  def create
    @suite = Suite.new(suite_params)
    if @suite.save
      redirect_to(suites_path, notice: 'Done')
    else
      redirect_to(suites_new_path, alert: 'Error')
    end
  end

  def update
    if @suite.update_attributes(suite_params)
      redirect_to(suites_path, notice: 'Done')
    else
      redirect_to(suite_edit_path, alert: 'Error')
    end
  end

  private

  def fetch_suite
    @suite = Suite.find(params[:id])
  end

  def suite_params
    params.require(:suite).permit(%i(title description))
  end
end
