class Case < ApplicationRecord
  belongs_to :section
  validates :title, presence: true, uniqueness: true, length: { maximum: 140 }
  validates_associated :section
  validates :template, inclusion: { in: %w(checklist testcase), message: 'Invalid template' }
end
