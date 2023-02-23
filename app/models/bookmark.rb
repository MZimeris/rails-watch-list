class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie, :list, presence: true
  validates_associated :movie, :list
  validates :comment, length: { minimum: 6 }
  validates_uniqueness_of :movie, :scope => :list
end
