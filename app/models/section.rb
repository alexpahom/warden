class Section < ApplicationRecord
  belongs_to :suite
  extend ActsAsTree::TreeView
  validates_presence_of :title
  acts_as_tree order: 'title'
end
