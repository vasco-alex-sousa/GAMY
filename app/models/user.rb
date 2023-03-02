class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :products
  has_one_attached :photo
  # validates :phone_number, presence: true, format: { with: /\\A\\+351\\s9\\d{8}\\z/, message: "must be in the format +351 9xxxxxxxx" }
  validates :city, :district, :country, presence: true
end
