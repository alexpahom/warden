class Case < ApplicationRecord
  belongs_to :section
  belongs_to :suite
  before_validation { self.template = template.downcase! }
  validates :title, presence: true, length: { maximum: 140 }
  validates :template, inclusion: { in: %w(checklist testcase), message: 'Invalid template' }
end
