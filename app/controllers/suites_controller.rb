class SuitesController < ApplicationController
  before_action :fetch_suite, only: %i(show edit update destroy)

  def index
    @suites = Suite.all
  end

  def new
    @suite = Suite.new
  end

  def show
    @sections = @suite.sections
  end

  def edit; end

  def create
    @suite = Suite.new(suite_params)
    if @suite.save
      redirect_to(suites_path, notice: 'Done')
    else
      redirect_to(new_suite_path, alert: @suite.errors.full_messages.to_sentence)
    end
  end

  def update
    if @suite.update_attributes(suite_params)
      redirect_to(suites_path, notice: 'Done')
    else
      redirect_to(edit_suite_path, alert: @suite.errors.full_messages.to_sentence)
    end
  end

  def destroy
    @suite.destroy
    redirect_to(suites_path, notice: 'Deleted')
  end

  private

  def fetch_suite
    @suite = Suite.find(params[:id])
  end

  def suite_params
    params.require(:suite).permit(%i(title description))
  end
end
