class Offer < ApplicationRecord
  belongs_to :user
  CATEGORIES = ["sneakers"]

  validates :brand, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :size, presence: true
  validates :color, presence: true
  validates :price_per_day, presence: true
end
