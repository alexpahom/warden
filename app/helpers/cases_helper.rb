module CasesHelper
  def setup_case(tcase)
    if tcase.steps.empty?
      tcase.steps.new
      tcase.exp_results.new
    end
    tcase
  end
end
