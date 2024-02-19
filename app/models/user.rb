class User < ApplicationRecord
  has_many :cosplays
  has_many :bookings

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
  validates :address, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
