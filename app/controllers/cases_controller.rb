class CasesController < ApplicationController
  before_action :fetch_suite_for_section
  before_action :fetch_case, only: %i(edit destroy)

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
    respond_to :js
  end

  def destroy
    @case.destroy
    update_section_cases

    respond_to do |format|
      format.js { flash[:success] = 'Deleted' }
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
    params.require(:case).permit(%i(section_id
                                    title
                                    template
                                    precondition
                                    steps
                                    exp_result
                                    suite_id))
  end

  def fetch_case
    @case = Case.find(params[:id])
  end

  def update_section_cases
    @section_cases = @case.section.cases
  end
end
