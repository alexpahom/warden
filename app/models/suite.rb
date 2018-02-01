class Suite < ApplicationRecord
  has_many :sections, dependent: :destroy
  validates :title, presence: true, uniqueness: true, length: { maximum: 140 }
  validates :description, length: { maximum: 2000 }
end
