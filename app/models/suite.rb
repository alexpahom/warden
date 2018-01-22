class Suite < ApplicationRecord
  has_many :sections
  validates :title, presence: true, uniqueness: true
end
