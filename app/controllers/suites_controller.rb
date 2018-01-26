class SuitesController < ApplicationController
  before_action :fetch_suite, only: %i(show edit update destroy)
  before_action :fetch_suite_for_section, only: %i(create_section new_section)

  # lists all the Test Suites
  def index
    @suites = Suite.all
  end

  # Test Suite creation page
  def new
    @suite = Suite.new
  end

  # Shows a content of a single Test Suite including Test Cases
  def show
    @sections = @suite.sections
    # @section = Section.new
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

  def new_section
    @section = Section.new
  end

  def create_section
    @section = @suite.sections.new(section_params)
    respond_to do |format|
      if @section.save
        format.js { flash[:success] = 'Done' }
      else
        format.js { flash[:alert] = @section.errors.full_messages.to_sentence }
      end
    end
  end

  private

  # Stores a particular Test Suite
  def fetch_suite
    @suite = Suite.find(params[:id])
  end

  def fetch_suite_for_section
    @suite = Suite.find(params[:suite_id])
  end

  # Strong parameters for a Test Suite
  def suite_params
    params.require(:suite).permit(%i(title description))
  end

  def section_params
    params.require(:section).permit(%i(title description parent_id))
  end
end
