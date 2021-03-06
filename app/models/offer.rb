class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  CATEGORIES = ["Sneakers", "Boots", "Heels"]

  validates :name, presence: true
  validates :brand, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :size, presence: true
  validates :color, presence: true
  validates :price_per_day, presence: true
  validates :address, presence: true
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
