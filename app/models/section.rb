class Section < ApplicationRecord
  belongs_to :suite
  extend ActsAsTree::TreeWalker
  validates_presence_of :title
  acts_as_tree order: 'title'
end
