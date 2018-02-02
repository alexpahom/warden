class SuitesController < ApplicationController
  before_action :fetch_suite, only: %i(temp show edit update destroy)

  # lists all the Test Suites
  def index
    @suites = Suite.all.order(:created_at)
  end

  # Test Suite creation page
  def new
    @suite = Suite.new
  end

  # Shows a content of a single Test Suite including Test Cases
  def show
    @sections = @suite.sections.order(:created_at)
  end

  # Test Suite edit page
  def edit; end

  # Lets create the Test Suite
  def create
    @suite = Suite.new(suite_params)
    if @suite.save
      redirect_to(suites_path, notice: 'Done')
    else
      redirect_to(new_suite_path, alert: @suite.errors.full_messages.to_sentence)
    end
  end

  # Updates Test Suite
  def update
    if @suite.update_attributes(suite_params)
      redirect_to(suites_path, notice: 'Done')
    else
      redirect_to(edit_suite_path, alert: @suite.errors.full_messages.to_sentence)
    end
  end

  # Deletes Test Suite
  def destroy
    @suite.destroy
    redirect_to(suites_path, notice: 'Deleted')
  end

  private

  # Stores a particular Test Suite
  def fetch_suite
    @suite = Suite.find(params[:id])
  end

  # Strong parameters for a Test Suite
  def suite_params
    params.require(:suite).permit(%i(title description))
  end
end
