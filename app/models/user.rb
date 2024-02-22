class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :cosplays
  has_many :bookings
  has_many :bookings_as_vendor, through: :cosplays, source: :bookings

  # validates :username, presence: true
  # validates :username, uniqueness: true
  # validates :email, presence: true
  # validates :password, presence: true
  # validates :address, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

end
