class CasesController < ApplicationController
  before_action :fetch_suite_for_section
  before_action :fetch_case, only: %i(edit update destroy)

  def create
    @case = @suite.cases.new(case_params)
    respond_to do |format|
      if @case.save
        format.js { flash[:success] = 'Done' }
      else
        format.js { flash[:alert] = render_error(@case) }
      end
    end
    update_section_cases
  end

  def edit
    @sections = {}
    @suite.sections.walk_tree do |section, level|
      @sections["#{'--' * level}#{section.title}"] = section.id
    end
  end

  def update
    if @case.update_attributes(case_params)
      redirect_to(suite_path(@suite), notice: 'Done')
    else
      redirect_to(edit_suite_case_path(@suite, @case), alert: render_error(@case))
    end
  end

  def destroy
    @case.destroy
    update_section_cases

    respond_to do |format|
      format.html { redirect_to(suite_path(@suite), notice: 'Deleted') }
      format.js   { flash[:success] = 'Deleted' }
    end
  end

  def bulk_destroy
    @suite.cases.where(id: params[:ids]).destroy_all

    respond_to do |format|
      format.js { flash[:success] = 'Done' }
    end
  end

  private

  def case_params
    params.require(:case).permit(case_attributes)
  end

  def fetch_case
    @case = Case.find(params[:id])
  end

  def update_section_cases
    @section_cases = @case.section.cases
  end

  def case_attributes
    [
      :section_id, :title, :template,
      :precondition, :suite_id, :test_data,
      steps_attributes: %i(id case_id position actual_result expected_result)
    ]
  end
end
