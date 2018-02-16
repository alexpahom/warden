class CasesController < ApplicationController
  before_action :fetch_suite_for_section
  before_action :fetch_case, only: %i(edit destroy)
  # after_action :update_section, only: %i(destroy create)

  def create
    @case = @suite.cases.new(case_params)
    respond_to do |format|
      if @case.save
        @section = @case.section.cases
        format.js { flash[:success] = 'Done' }
      else
        format.js { flash[:alert] = @case.errors.full_messages.to_sentence }
      end
    end
  end

  def edit
    respond_to :js
  end

  def destroy
    respond_to do |format|
      @case.destroy
      @section = @case.section.cases
      format.js { flash[:success] = 'Deleted' }
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

  # def update_section
  #   binding.pry
  #   @section = @case.section
  # end
end
