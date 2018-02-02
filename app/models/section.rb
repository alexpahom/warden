class Section < ApplicationRecord
  belongs_to :suite
  has_many :cases, dependent: :destroy
  extend ActsAsTree::TreeWalker
  validates :title, presence: true, length: { maximum: 140 }
  validates_uniqueness_of :title, scope: :suite_id
  validates :description, length: { maximum: 2000 }
  acts_as_tree order: 'title'
end
