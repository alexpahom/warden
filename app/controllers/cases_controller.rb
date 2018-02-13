class CasesController < ApplicationController
  before_action :fetch_suite_for_section
  before_action :fetch_section, only: %i(destroy)

  def create
    @case = @suite.cases.new(case_params)
    respond_to do |format|
      if @case.save
        format.js { flash[:success] = 'Done' }
      else
        format.js { flash[:alert] = @case.errors.full_messages.to_sentence }
      end
    end
  end

  def destroy
    respond_to do |format|
      @case.destroy
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
end
