module CasesHelper
  def setup_case(tcase)
    tcase.steps.new(position: 1) if tcase.steps.empty?
    tcase
  end
end
