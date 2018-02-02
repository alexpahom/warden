class Section < ApplicationRecord
  belongs_to :suite
  extend ActsAsTree::TreeWalker
  validates :title, presence: true, uniqueness: true, length: { maximum: 140 }
  validates :description, length: { maximum: 2000 }
  acts_as_tree order: 'title'
end
