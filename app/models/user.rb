class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :offers, dependent: :destroy
  has_many :bookings, through: :offers

  validates :username, presence: true, uniqueness: true
  validates :address, presence: true
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
