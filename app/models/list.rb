class List < ApplicationRecord
  has_one_attached :image
  attr_accessor :image_url

  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
