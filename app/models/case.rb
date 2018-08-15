class Case < ApplicationRecord
  belongs_to :section
  belongs_to :suite
  has_many :steps
  has_many :exp_results

  accepts_nested_attributes_for :steps, allow_destroy: true
  accepts_nested_attributes_for :exp_results, allow_destroy: true

  # before_validation { self.template = template.downcase! }
  validates :title, presence: true, length: { maximum: 140 }
  validates :template, inclusion: { in: %w(checklist testcase), message: 'Invalid template' }
end
